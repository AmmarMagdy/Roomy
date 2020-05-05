//
//  Router.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 4/27/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case login(_ email: String, _ password: String)
    case signup(_ name: String, _ email: String, _ password: String)
    case addRoom(_ title: String, _ place: String, _ price: String, _ description: String, _ image: String)
    case getAllRooms
    
    var url: URL {
        switch self {
        case .login:
            return URL(string: "https://roomy-application.herokuapp.com/auth/login")!
        case .signup:
            return URL(string: "https://roomy-application.herokuapp.com/signup")!
        case .addRoom,.getAllRooms :
            return URL(string: "https://roomy-application.herokuapp.com/rooms")!
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllRooms:
            return .get
        default:
            return .post
        }
    }
    
    var header: HTTPHeaders {
        switch self {
        case .addRoom,.getAllRooms:
           return [HTTPHeader(name: "Authorization", value: UserDefaults.standard.string(forKey: "token")!)]
        default:
            return [:]
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .login(let email, let password):
            return ["email": email,
                    "password": password]
            
        case .signup(let name, let email, let password):
            return ["name": name,
                    "email": email,
                    "password": password]
            
        case .addRoom( let title, let place, let price, let description, let image):
            return ["title": title,
                    "place": place,
                    "price": price,
                    "description": description,
                    "image": image]
            
        case .getAllRooms:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        urlRequest.headers = header
        return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameter)
    }
    
}
