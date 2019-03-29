//
//  UserSession.swift
//  DesafioLogin
//
//  Created by Ranieri Aguiar on 29/03/19.
//  Copyright © 2019 Ranieri. All rights reserved.
//

import Foundation

class UserSession: Codable {
    
    var token: String?
    var tokenExpiration: Date?
}
