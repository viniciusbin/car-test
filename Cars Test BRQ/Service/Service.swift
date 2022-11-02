//
//  Service.swift
//  Cars Test BRQ
//
//  Created by Vinicius on 31/10/22.
//

import Foundation

enum ServiceError: Error {
    case invalidURL
    case decodeFail(Error?)
    case network(Error?)
    case noData
}

class Service {
    
    func postRequest(user: String, password: String, callback: @escaping(Result<UserDetailsModel?, Error>) -> Void) {
        let user: UserModel = .init(username: user, password: password)
        let jsonData = try? JSONEncoder().encode(user)
        guard let url = URL(string: "https://carros-springboot.herokuapp.com/api/v2/login") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            do {
                let responseJSON = try? JSONDecoder().decode(UserDetailsModel.self, from: data)
                guard let responseJSON = responseJSON else {
                    callback(.failure(ServiceError.noData))
                    return
                }
                callback(.success(responseJSON))
                //                print(responseJSON)
            } catch {
                callback(.failure(ServiceError.decodeFail(error)))
            }
        }
        task.resume()
    }
    
    
    func getCars(callback: @escaping(Result<Cars, Error>) -> Void) {
        
        let baseURL = "https://carros-springboot.herokuapp.com/api/v2/carros"
        guard let url = URL(string: baseURL) else {
            callback(.failure(ServiceError.invalidURL))
            return
        }
        guard let token = AuthService.shared.userLogged?.token else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { payload, response, error in
            guard let payload = payload else {
                callback(.failure(ServiceError.network(error)))
                return
            }
            do {
                let car = try? JSONDecoder().decode(Cars.self, from: payload)
                guard let car = car else {
                    callback(.failure(ServiceError.noData))
                    return
                }
                
                callback(.success(car))
                print(car)
            } catch {
                callback(.failure(ServiceError.decodeFail(error)))
            }
        }
        task.resume()
    }
}



