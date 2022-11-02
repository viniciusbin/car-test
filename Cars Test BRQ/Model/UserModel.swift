//
//  UserModel.swift
//  Cars Test BRQ
//
//  Created by Vinicius on 31/10/22.
//

import Foundation

struct UserDetailsModel:Codable {
    let id: Int
    let login: String
    let nome: String
    let email: String
    let urlFoto: String
    let token: String
    let roles: [String]
}

struct UserModel: Codable {
    let username: String
    let password: String
}
