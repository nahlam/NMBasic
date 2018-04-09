//
//  BasicNetworkManager.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 7/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SBJson4
import SwiftyJSON
import Reachability


public typealias APIRequestCompletionHandlerClosureType = (_ requestURL:String ,_ response: JSON?,_ error: Error?) -> Void
public typealias APIFileUploadClosureType = (_ requestURL:String,_ response: JSON? ,_ success: Bool) -> Void

open class BasicNetworkManager: BasicManager {
    
    public struct Contants {
        public struct Request {
            public static let Payload                          = "pl"
            public struct Header {
                public struct Key  {
                    public static let ContentLength            = "Content-Length"
                    public static let Accept                   = "Accept"
                    public static let ContentType              = "Content-Type"
                    public static let Authorization            = "X-Custom-Authorization"
                    public static let Device                   = "Device-Id"
                    public static let Version                  = "Version-Number"
                }
                public struct Value {
                    public static let JSON                     = "application/json"
                }
            }
        }
        public struct Response {
            public static let ReponseJSON                      = "response"
            public static let Error                            = "error"
        }
    }
    open static let ImageMimeType = "image/jpeg"
    open static let VideoMimeType = "video/mp4"
    
    open class func showInternetLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    open class func hideInternetLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    open class func hasConnectivity() -> Bool {
        let reachability: Reachability = Reachability.forInternetConnection()
        let networkStatus: Int = reachability.currentReachabilityStatus().rawValue
        return networkStatus != 0
    }
    
    
    
    open class func getRequestJSONContentWithLengthWithURL(stringURL: String, method: HTTPMethod, params: [String : AnyObject]?, deviceId: String, appVersion: String?, sendBasicParameters: Bool,handleDefaultResponse: Bool, handler: @escaping APIRequestCompletionHandlerClosureType) -> Request    {
        return self.getBasicRequestWithURL(stringURL: stringURL, method: method, params: params, deviceId: deviceId, hmac: nil, appVersion: appVersion, isJSONContentType: true, sendContentLength: true,handleDefaultResponse: handleDefaultResponse, handler: handler)
    }
    
    
    open class func getRequestJSONContentWithURL(stringURL: String, method: HTTPMethod, params: [String : AnyObject]?, deviceId: String, appVersion: String?, sendBasicParameters: Bool,handleDefaultResponse: Bool, handler: @escaping APIRequestCompletionHandlerClosureType) -> Request    {
        return self.getBasicRequestWithURL(stringURL: stringURL, method: method, params: params, deviceId: deviceId, hmac: nil, appVersion: appVersion, isJSONContentType: true,handleDefaultResponse: handleDefaultResponse, handler: handler)
    }
    
    open class func getRequestWithURL(stringURL: String, method: HTTPMethod, params: [String : AnyObject]?, deviceId: String, appVersion: String? = nil,handleDefaultResponse: Bool, handler: @escaping APIRequestCompletionHandlerClosureType) -> Request    {
        return self.getBasicRequestWithURL(stringURL: stringURL, method: method, params: params, deviceId: deviceId, hmac: nil, appVersion: appVersion,handleDefaultResponse: handleDefaultResponse, handler: handler)
    }
    
    open class func getBasicRequestWithURL(stringURL: String, method: HTTPMethod, params: [String : AnyObject]?,handleDefaultResponse: Bool, handler: @escaping APIRequestCompletionHandlerClosureType) -> Request    {
        return self.getBasicRequestWithURL(stringURL: stringURL, method: method, params: params, headers: nil, handleDefaultResponse: handleDefaultResponse, handler: handler)
    }
    
    
    open class func getBasicRequestWithURL(stringURL: String, method: HTTPMethod, params: [String : AnyObject]?, deviceId: String, hmac: String?, appVersion: String?, isJSONContentType: Bool = false, sendContentLength: Bool = false, handleDefaultResponse: Bool, handler: @escaping APIRequestCompletionHandlerClosureType) -> Request    {
        
        var headers : HTTPHeaders = [BasicNetworkManager.Contants.Request.Header.Key.Device : deviceId]
        
        if appVersion != nil {
            headers[BasicNetworkManager.Contants.Request.Header.Key.Version] = appVersion!
        }
        if hmac != nil {
            headers[BasicNetworkManager.Contants.Request.Header.Key.Authorization] = hmac!
        }
        
        if isJSONContentType {
            headers[BasicNetworkManager.Contants.Request.Header.Key.ContentType] = BasicNetworkManager.Contants.Request.Header.Value.JSON
        }
        
        if sendContentLength {
            let timeStamp: String = self.getTimeStamp()
            print("Date -> \(Date()) , Time: \(timeStamp)")
            var requestParams: [String: AnyObject] = [String : AnyObject]()
            if params != nil {
                requestParams = params!
            }
            
            let jsonWriter: SBJson4Writer = SBJson4Writer()
            let bodyString: String = jsonWriter.string(with: requestParams)
            
            let length: Int = bodyString.count
            let contentLength :String = "\(length)"
            headers[BasicNetworkManager.Contants.Request.Header.Key.ContentLength] = contentLength
        }
        
        return self.getBasicRequestWithURL(stringURL: stringURL, method: method, params: params, headers: headers,handleDefaultResponse: handleDefaultResponse, handler: handler)
    }
    
    
    open class func getBasicRequestWithURL(stringURL: String, method: HTTPMethod, params: [String : AnyObject]?, headers : HTTPHeaders?, handleDefaultResponse: Bool, handler: @escaping APIRequestCompletionHandlerClosureType) -> Request    {
        
        let sessionManager = NMSessionManager.sharedManager
        let request: Request = sessionManager.request(stringURL, method: method, parameters: params, encoding: (method == HTTPMethod.get) ? URLEncoding.default : JSONEncoding.default , headers: headers).responseJSON { (response) in
            
            DispatchQueue.global(qos: .background).async {
                switch response.result {
                case .success:
                    let value = JSON(response.result.value)
                    self.handleSuccessResponse(requestURL: stringURL, request: response.request, response: value, handleDefaultResponse: handleDefaultResponse, handler: handler)
                    return
                case .failure(let error):
                    self.handleFailureResponse(requestURL: stringURL, request: response.request, error: error, handler: handler)
                    return
                }
            }
        }
        return request
    }
    
    
    
    private class func getStringFromParamters(params: [String : AnyObject])  -> String {
        
        let parameterArray = params.map { key, value -> String in
            let percentEscapedKey = key.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            let percentEscapedValue = (value as! String).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joined(separator: "&")
    }
    
    private class func handleSuccessResponse(requestURL:String, request: URLRequest?, response: JSON? , handleDefaultResponse: Bool, handler: @escaping APIRequestCompletionHandlerClosureType) {
        
        
        #if DEBUG
            print("*****************************************")
            if request != nil {
                print("Request: \(request!)")
            }else {
                print("Request URL: \(requestURL)")
            }
            
        #endif
        
        
        if response == nil {
            handler(requestURL, nil, getGeneralError())
        }else {
            if handleDefaultResponse {
                
                #if DEBUG
                    print("*****************************************")
                    print("VALUE : \(String(describing: response!))")
                    print("*****************************************")
                #endif
                
                
                if let returnValue = response?[BasicNetworkManager.Contants.Response.ReponseJSON] {
                    let jsonValue:JSON = JSON(returnValue)
                    
                    if jsonValue.type == .null || jsonValue.type == .unknown {
                        print("Response : GENERAL ERROR")
                        DispatchQueue.main.async {
                            handler(requestURL, nil, getGeneralError())
                        }
                    }else {
                        #if DEBUG
                            print("#########################################")
                            print("Response : \(jsonValue)")
                            print("#########################################")
                        #endif
                        DispatchQueue.main.async {
                            handler(requestURL, jsonValue, nil)
                        }
                    }
                    
                }else if response![BasicNetworkManager.Contants.Response.Error] != nil {
                    
                    let errorJSON:JSON = JSON(response![BasicNetworkManager.Contants.Response.Error])
                    if errorJSON.type == .null || errorJSON.type == .unknown {
                        #if DEBUG
                            print("Response : GENERAL ERROR")
                        #endif
                        DispatchQueue.main.async {
                            handler(requestURL, nil, getGeneralError())
                        }
                    }else {
                        
                        let error:Error = self.getErrorFromDictionary(errorDict: errorJSON)
                        print("#########################################")
                        print("Response : \(errorJSON)")
                        print("#########################################")
                        
                        DispatchQueue.main.async {
                            handler(requestURL, nil, error)
                        }
                    }
                }else   {
                    #if DEBUG
                        print("Response : GENERAL ERROR")
                    #endif
                    DispatchQueue.main.async {
                        handler(requestURL, nil, getGeneralError())
                    }
                }
            }else {
                let json = JSON(response!)
                #if DEBUG
                    print("#########################################")
                    print("Response : \(json)")
                    print("#########################################")
                #endif
                DispatchQueue.main.async {
                    handler(requestURL, json, nil)
                }
            }
        }
        
        
        
    }
    
    private class func handleFailureResponse(requestURL:String, request: URLRequest?, error: Error? , handler: @escaping APIRequestCompletionHandlerClosureType) {
        #if DEBUG
            print("#########################################")
            print("Error Response: \(error?.localizedDescription ?? "")")
            print("#########################################")
        #endif
        
        DispatchQueue.main.async {
            handler(requestURL, nil, error)
        }
    }
    
    
    open class func uploadData(urlString: String, parameters: [String: AnyObject], data:[(data: Data,name: String,mime: String)], handler: @escaping APIFileUploadClosureType) {
        
        Alamofire.upload(
            multipartFormData: { MultipartFormData in
                
                for (key, value) in parameters {
                    MultipartFormData.append(value.data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
                
                for dataObject in data {
                    MultipartFormData.append(dataObject.data, withName: dataObject.name, fileName: dataObject.name, mimeType: dataObject.mime)
                }
                
        }, to: urlString) { (result) in
            
            switch result {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    if let value = response.value {
                        let json = JSON(value)[BasicNetworkManager.Contants.Response.ReponseJSON]
                        handler(urlString, json, true)
                    }else {
                        handler(urlString, nil, false)
                    }
                }
                
            case .failure( _):
                handler(urlString, nil, false)
            }
        }
    }
    
    open class func getTimeStamp() -> String {
        let unixTime: Int = Int(floor(Date().timeIntervalSince1970))
        let timestamp: String = "\(unixTime)"
        return timestamp
    }
}

