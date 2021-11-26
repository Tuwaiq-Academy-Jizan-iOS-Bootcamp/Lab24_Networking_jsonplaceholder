//
//  structJSON.swift
//  yousef_almalki_lab24
//
//  Created by يوسف جابر المالكي on 22/04/1443 AH.
//

import Foundation
// MARK: - Element
struct Element: Decodable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Decodable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Decodable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Decodable {
    let name, catchPhrase, bs: String
}

//typealias Empty = [Element]
