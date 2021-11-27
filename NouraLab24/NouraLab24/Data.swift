//
//  Data.swift
//  NouraLab24
//
//  Created by NoON .. on 22/04/1443 AH.
//

import Foundation

// WelcomeElement
struct Pesrsonal: Codable {
    let id:Int
    let name:String
    let username:String
    let email:String
    let address: Address
    let phone, website:String
    let company: Company
}

// Address
struct Address: Codable {
    let street:String
    let suite:String
    let city:String
    let zipcode:String
    let geo: Geo
}

// Geo
struct Geo: Codable {
    let lat:String
    let lng:String
}

// Company
struct Company: Codable {
    let name:String
    let catchPhrase:String
    let bs:String
}
typealias pesrsonal = [Pesrsonal]
