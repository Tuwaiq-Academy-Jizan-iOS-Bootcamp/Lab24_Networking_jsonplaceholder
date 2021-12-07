//
//  viewcontrollerstrcut.swift
//  Lab24
//
//  Created by زهور حسين on 23/04/1443 AH.
//

import Foundation

struct PersonData: Codable {
 var id: Int
    var idString: String{
        return String(id)
    }
 var name: String
var username: String
var email: String
var address: Address
var phone: String
var website: String
 var company : Company
}

struct Address: Codable{
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geo
}

struct Company: Codable {
    var name: String
    var catchPhrase: String
    var bs: String
}


struct Geo: Codable {
    var lat: String
    var lng: String
}
//typealias Hello = [PersonData]
