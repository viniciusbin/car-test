//
//  CarModel.swift
//  Cars Test BRQ
//
//  Created by Vinicius on 02/11/22.
//

import Foundation

//struct CarList: Codable {
//    let carDetail: [Car]
//}

struct Car: Codable {
    let id: Int
    let nome: String
    let tipo: String
    let descricao: String
    let urlFoto: String?
    let urlVideo: String?
    let latitude: String?
    let longitude: String?
}

typealias Cars = [Car]
