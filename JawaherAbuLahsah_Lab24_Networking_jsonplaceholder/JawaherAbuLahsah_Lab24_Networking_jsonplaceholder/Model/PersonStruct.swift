//
//  PersonStruct.swift
//  JawaherAbuLahsah_Lab24_Networking_jsonplaceholder
//
//  Created by Jawaher Mohammad on 20/04/1443 AH.
//

import Foundation
struct Person : Codable{
    var id :Int
    var name : String
    var username : String
    var email : String
    var address : Address
    var phone : String
    var website : String
    var company : Company
}
