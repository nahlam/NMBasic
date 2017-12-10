//
//  NMSessionManager.swift
//  NMBasic
//
//  Created by Nahla Mortada on 12/10/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import Alamofire

class NMSessionManager: Alamofire.SessionManager {
    
    public static let sharedManager: NMSessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let manager = NMSessionManager(configuration: configuration)
        return manager
    }()
    
}

