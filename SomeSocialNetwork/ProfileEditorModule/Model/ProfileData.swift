//
//  ProfileData.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 02.07.2022.
//

import Foundation

struct ProfileData: Encodable {
    let email: String
    let firstName: String
    let lastName: String
    let birthdate: String
    let preferences: [String]
    let organization: String
    let position: String
    let birth_place: String
    let middleName: String
    let image: Data
}
