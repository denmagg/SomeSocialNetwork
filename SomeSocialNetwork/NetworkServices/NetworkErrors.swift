//
//  NetworkErrors.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 03.07.2022.
//

import Foundation

enum NetworkError: Error, Equatable {
    case failedToSendLoginData
    case failedToSendRegistrationData
    case failedToSaveUserProfile
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .failedToSendLoginData:
            return NSLocalizedString("Failed  to send login data to http://94.127.67.113:8099/checkLogin", comment: "1")
        case .failedToSendRegistrationData:
            return NSLocalizedString("Failed  to send login data to http://94.127.67.113:8099/registerUser", comment: "2")
        case .failedToSaveUserProfile:
            return NSLocalizedString("Failed  to send login data to http://94.127.67.113:8099/updateProfile", comment: "3")
        }
    }
}
