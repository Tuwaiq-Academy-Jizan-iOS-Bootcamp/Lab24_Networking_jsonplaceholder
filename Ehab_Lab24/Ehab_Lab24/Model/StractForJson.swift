//
//  StractForJson.swift
//  Ehab_Lab24
//
//  Created by Ehab Hakami on 21/04/1443 AH.
//



import Foundation


// MARK: - informationPerson
struct InformationPerson: Codable {
    var id: Int
    var name, username, email: String
    var address: Address
    var phone, website: String
    var company: Company
}

// MARK: - Address
struct Address: Codable {
    var street, suite, city, zipcode: String
    var geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    var lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    var name, catchPhrase, bs: String
}

typealias Welcome = [InformationPerson]



