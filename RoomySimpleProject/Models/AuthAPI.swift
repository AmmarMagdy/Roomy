//
//  AuthAPI.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 4/28/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import Foundation

struct AuthAPI : Codable {

    let authToken : String?


    enum CodingKeys: String, CodingKey {
        case authToken = "auth_token"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        authToken = try values.decodeIfPresent(String.self, forKey: .authToken)
    }


}
