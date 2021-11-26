//
//  AddressStruct.swift
//  JawaherAbuLahsah_Lab24_Networking_jsonplaceholder
//
//  Created by Jawaher Mohammad on 20/04/1443 AH.
//

import Foundation
struct Address:Codable{
    var street :String
    var suite : String
    var city : String
    var zipcode :String
    var geo :Geo
}
