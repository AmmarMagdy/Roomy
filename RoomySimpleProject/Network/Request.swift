//
//  Request.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 4/27/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import Foundation
import Alamofire
import KeychainSwift

class Request {
    static func requestAPI(router: Router, _ completionHandler: @escaping (Result<Data, Error>, Int?) -> Void) {
        
        AF.request(router).responseData { (response: AFDataResponse<Data>) in
            switch response.result {
            case .success(let data):
                completionHandler(.success(data), response.response?.statusCode)
                if response.response?.statusCode == 422 {
                    KeychainSwift().delete("auth_token")
                }
            case.failure(let error):
                completionHandler(.failure(error), response.response?.statusCode)
            }
        }
    }
}


