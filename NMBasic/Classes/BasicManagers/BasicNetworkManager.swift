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
public typealias APIFileUploadClosureType = (_ requestURL:String,_ response: JSON? ,_ error: Error?) -> Void

open class BasicNetworkManager: BasicManager {
    
    public struct NetworkContants {
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
    public static let ImageMimeType = "image/jpeg"
    public static let VideoMimeType = "video/mp4"
    
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
    
    
    
    open class func getRequestJSONContentWithLengthWithURL(stringURL: String, method: HTTPMethod, params: [String : AnyObject]?, deviceId: String, appVersion: String?, sendBasicParameters: Bool, handler: @escaping APIRequestCompletionHandlerClosureType) -> Request    {
        return getBasicRequestWithURL(stringURL: stringURL, method: method, params: params, deviceId: deviceId, hmac: nil, appVersion: appVersion, isJSONContentType: true, sendContentLength: true, handler: handler)
    }
    
    
    open class func getRequestJSONContentWithURL(stringURL: String, method: HTTPMethod, params: [String : AnyObject]?, deviceId: String, appVersion: String?, sendBasicParameters: Bool, handler: @escaping APIRequestCompletionHandlerClosureType) -> Request    {
        return getBasicRequestWithURL(stringURL: stringURL, method: method, params: params, deviceId: deviceId, hmac: nil, appVersion: appVersion, isJSONContentType: true, handler: handler)
    }
    
    open class func getRequestWithURL(stringURL: String, method: HTTPMethod, params: [String : AnyObject]?, deviceId: String, appVersion: String? = nil, handler: @escaping APIRequestCompletionHandlerClosureType) -> Request    {
        return getBasicRequestWithURL(stringURL: stringURL, method: method, params: params, deviceId: deviceId, hmac: nil, appVersion: appVersion, handler: handler)
    }
    
    open class func getBasicRequestWithURL(stringURL: String, method: HTTPMethod, params: [String : AnyObject]?, handler: @escaping APIRequestCompletionHandlerClosureType) -> Request    {
        return getBasicRequestWithURL(stringURL: stringURL, method: method, params: params, headers: nil, handler: handler)
    }
    
    
    open class func getBasicRequestWithURL(stringURL: String, method: HTTPMethod, params: [String : AnyObject]?, deviceId: String, hmac: String?, appVersion: String?, isJSONContentType: Bool = false, sendContentLength: Bool = false, handler: @escaping APIRequestCompletionHandlerClosureType) -> Request    {
        
        var headers : HTTPHeaders = [BasicNetworkManager.NetworkContants.Request.Header.Key.Device : deviceId]
        
        if appVersion != nil {
            headers[BasicNetworkManager.NetworkContants.Request.Header.Key.Version] = appVersion!
        }
        if hmac != nil {
            headers[BasicNetworkManager.NetworkContants.Request.Header.Key.Authorization] = hmac!
        }
        
        if isJSONContentType {
            headers[BasicNetworkManager.NetworkContants.Request.Header.Key.ContentType] = BasicNetworkManager.NetworkContants.Request.Header.Value.JSON
        }
        
        if sendContentLength {
            let timeStamp: String = getTimeStamp()
            print("[Netowrk]", "Date -> \(Date()) , Time: \(timeStamp)")
            var requestParams: [String: AnyObject] = [String : AnyObject]()
            if params != nil {
                requestParams = params!
            }
            
            let jsonWriter: SBJson4Writer = SBJson4Writer()
            let bodyString: String = jsonWriter.string(with: requestParams)
            
            let length: Int = bodyString.count
            let contentLength :String = "\(length)"
            headers[BasicNetworkManager.NetworkContants.Request.Header.Key.ContentLength] = contentLength
        }
        
        return getBasicRequestWithURL(stringURL: stringURL, method: method, params: params, headers: headers, handler: handler)
    }
    
    
    open class func getBasicRequestWithURL(stringURL: String, method: HTTPMethod, params: [String : AnyObject]?, headers : HTTPHeaders?, handler: @escaping APIRequestCompletionHandlerClosureType) -> Request    {
        
        let sessionManager = NMSessionManager.sharedManager
        let request: Request = sessionManager.request(stringURL, method: method, parameters: params, encoding: (method == HTTPMethod.get) ? URLEncoding.default : JSONEncoding.default , headers: headers).responseJSON { (response) in
            
            printRequest(requestURL: stringURL, params: params, request: response.request)
            DispatchQueue.global(qos: .background).async {
                switch response.result {
                case .success:
                    let value = response.result.value as? [String: AnyObject]
                    handleSuccessResponse(requestURL: stringURL, params: params, request: response.request, response: value, handler: handler)
                    return
                case .failure(let error):
                    handleFailureResponse(requestURL: stringURL, params: params, request: response.request, error: error, handler: handler)
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
    
    
    private class func printRequest(requestURL:String, params: [String : AnyObject]? , request: URLRequest?)   {
        print("*****************************************")
        if request != nil {
            print("[Network] [Request]", "Request: ", request!)
        }else {
            print("[Network] [Request]","Request URL: \(requestURL)")
        }
        if let bodyData = request?.httpBody {
            do {
                let paramsDict = try JSON.init(data: bodyData)
                print("[Network] [Parameters] ", paramsDict)
            } catch {
                if params != nil {
                    print("[Network] [Parameters] ", params!)
                }
            }
        }
        
        print("Request: \(requestURL)")
        print("*****************************************")
    }
    
    private class func handleSuccessResponse(requestURL:String, params: [String : AnyObject]? , request: URLRequest?, response: [String: AnyObject]? , handler: @escaping APIRequestCompletionHandlerClosureType) {

        if let returnValue = response![BasicNetworkManager.NetworkContants.Response.ReponseJSON] {
            let jsonValue:JSON = JSON(returnValue)
            
            if jsonValue.type == .null || jsonValue.type == .unknown {
                print("[Network] [Response]", "GENERAL ERROR jsonValue Unknown or Null")
                DispatchQueue.main.async {
                    handler(requestURL, nil, getGeneralError())
                }
            }else {
                print("[Network] [Response] ", jsonValue)
                DispatchQueue.main.async {
                    handler(requestURL, jsonValue, nil)
                }
            }
            
        }else if response![BasicNetworkManager.NetworkContants.Response.Error] != nil {
            
            let errorJSON:JSON = JSON(response![BasicNetworkManager.NetworkContants.Response.Error]!)
            if errorJSON.type == .null || errorJSON.type == .unknown {
                
                print("[Network] [Response]", "GENERAL ERROR jsonValue Unknown or Null")
                DispatchQueue.main.async {
                    handler(requestURL, nil, getGeneralError())
                }
            }else {
                let error:Error = getErrorFromDictionary(errorDict: errorJSON)
                print("[Network] [Response]", errorJSON)
                
                DispatchQueue.main.async {
                    handler(requestURL, nil, error)
                }
            }
        }else   {
            print("[Network] [Response]", "GENERAL ERROR")
            DispatchQueue.main.async {
                handler(requestURL, nil, getGeneralError())
            }
        }
        
    }
    
    private class func handleFailureResponse(requestURL:String, params: [String : AnyObject]?, request: URLRequest?, error: Error? , handler: @escaping APIRequestCompletionHandlerClosureType) {

        print("[Network] [Response]", error?.localizedDescription ?? "")
        
        DispatchQueue.main.async {
            handler(requestURL, nil, error)
        }
    }
    
    
    open class func uploadData(urlString: String, parameters: [String: AnyObject], data:[(data: Data,name: String,mime: String)], progress: @escaping Request.ProgressHandler, handler: @escaping APIFileUploadClosureType) {
        Alamofire.upload(
            multipartFormData: { MultipartFormData in
                
                for (key, value) in parameters {
                    MultipartFormData.append(value.data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
                
                for dataObject in data {
                    MultipartFormData.append(dataObject.data, withName: dataObject.name, fileName: dataObject.name, mimeType: dataObject.mime)
                }
                
        }, to: urlString) { (result) in
            
            parseDataUploadReturn(urlString: urlString, result: result, progress: progress, handler: handler)
        }
    }
    
    class func parseDataUploadReturn(urlString: String, result: SessionManager.MultipartFormDataEncodingResult, progress: @escaping Request.ProgressHandler, handler: @escaping APIFileUploadClosureType)  {
        switch result {
        case .success(let upload, _, _):
            
            upload.uploadProgress(closure: progress)
            upload.responseJSON { response in
                if let value = response.value {
                    let json = JSON(value)[BasicNetworkManager.NetworkContants.Response.ReponseJSON]
                    handler(urlString, json, nil)
                }else {
                    handler(urlString, nil, getGeneralError())
                }
            }
            upload.responseString(completionHandler: { (response) in
                print("[Network] [Response] [Upload]", response)
            })
        case .failure(let error):
            handler(urlString, nil, error)
        }
    }
    
    open class func getTimeStamp() -> String {
        let unixTime: Int = Int(floor(Date().timeIntervalSince1970))
        let timestamp: String = "\(unixTime)"
        return timestamp
    }
}
