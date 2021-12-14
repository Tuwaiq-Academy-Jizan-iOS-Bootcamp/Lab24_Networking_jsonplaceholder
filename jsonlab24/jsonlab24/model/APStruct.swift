//
//  API StructsViewController.swift
//  jsonlab24
//
//  Created by موسى مسملي on 14/12/2021.
//

import Foundation
struct Companys:Codable {
    var name: String
    var catchPhrase: String
    var bs: String
}
struct Geos:Codable {
    var lat: String
    var lng: String
}
struct Addresses:Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geos //another struct
}
struct PesronInfo:Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Addresses // another struct
    var phone: String
    var website: String
    var company: Companys // another struct
}
