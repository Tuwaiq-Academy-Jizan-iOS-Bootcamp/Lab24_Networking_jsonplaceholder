//
//  Address.swift
//  MaramFaqih_Lab24_Networking_jsonplaceholder
//
//  Created by meme f on 22/04/1443 AH.
//

import Foundation
class Address : Codable{
    var street : String
    var suite : String
    var city : String
    var zipcode : String
    var geo : Geo
}
