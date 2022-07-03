//
//  signUpData.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 02.07.2022.
//

import Foundation

struct RegistrationData: Encodable {
    let email: String
    let firstName: String
    let lastName: String
    let password: String
}
