//
//  PersonInformation.swift
//  Bushra Barakat_Lab24
//
//  Created by Bushra Barakat on 22/04/1443 AH.
//

import Foundation
struct Geo: Codable{
    var lat: String
    var lng: String
}
struct Address: Codable{
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo : Geo
}
struct Company: Codable{
    var name: String
    var catchPhrase: String
    var bs: String
}
struct Person : Codable{
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
}
