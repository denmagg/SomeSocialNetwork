//
//  NetworkService.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 02.07.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func registerUser(withRegistrationData userData: RegistrationData, complition: @escaping (Result<Int, NetworkError>) -> Void)
    func loginUser(withLoginData userData: LoginData, complition: @escaping (Result<Int, NetworkError>) -> Void)
    func saveUserProfile(withProfileData userData: ProfileData, complition: @escaping (Result<Int, NetworkError>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    //MARK: private properties
    
    private enum Consts {
        static let registerUrlString = "http://94.127.67.113:8099/registerUser"
        static let loginUrlString = "http://94.127.67.113:8099/updateProfile"
        static let saveProfileUrlString = "http://94.127.67.113:8099/checkLogin"
    }
    
    //MARK: methods
    
    func registerUser(withRegistrationData userData: RegistrationData, complition: @escaping (Result<Int, NetworkError>) -> Void) {
        guard let url = URL(string: Consts.registerUrlString) else { return }
    
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let httpBody = try? JSONEncoder().encode(userData) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, responce, error) in
            guard let responce = responce, let data = data else { return }
            print(responce)
        }
    }
    
    func loginUser(withLoginData userData: LoginData, complition: @escaping (Result<Int, NetworkError>) -> Void) {
        print("Найс запрос пошел")
        guard let url = URL(string: Consts.loginUrlString) else { return }
    
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let httpBody = try? JSONEncoder().encode(userData) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (_, response, _) in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    complition(.success(httpResponse.statusCode))
                    return
                }
            }
            complition(.failure(.failedToSendLoginData))
            return
        }.resume()
    }
    
    func saveUserProfile(withProfileData userData: ProfileData, complition: @escaping (Result<Int, NetworkError>) -> Void) {
        guard let url = URL(string: Consts.saveProfileUrlString) else { return }
    
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let httpBody = try? JSONEncoder().encode(userData) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, responce, error) in
            guard let responce = responce, let data = data else { return }
            print(responce)
        }
    }
    
}
