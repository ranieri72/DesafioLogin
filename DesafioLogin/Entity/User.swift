//
//  User.swift
//  DesafioLogin
//
//  Created by Ranieri Aguiar on 29/03/19.
//  Copyright © 2019 Ranieri. All rights reserved.
//

class User: Codable {
    
    var user_id: Int64?
    var user_email: String?
    var user_password: String? = ""
}
