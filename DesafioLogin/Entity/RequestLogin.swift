//
//  RequestLogin.swift
//  DesafioLogin
//
//  Created by Ranieri Aguiar on 29/03/19.
//  Copyright © 2019 Ranieri. All rights reserved.
//

class RequestLogin: Codable {
    
    var user: User?
    var session: UserSession?
    var error: String?
}
