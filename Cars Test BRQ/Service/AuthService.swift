//
//  AuthService.swift
//  Cars Test BRQ
//
//  Created by Vinicius on 01/11/22.
//

import Foundation

class AuthService {
    
    
    static let shared = AuthService()
    private init() {}
    public var userLogged: UserDetailsModel?
}
