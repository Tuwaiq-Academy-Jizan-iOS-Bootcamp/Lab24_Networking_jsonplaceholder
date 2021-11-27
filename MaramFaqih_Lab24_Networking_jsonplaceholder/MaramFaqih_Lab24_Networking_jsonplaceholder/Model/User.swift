//
//  File.swift
//  MaramFaqih_Lab24_Networking_jsonplaceholder
//
//  Created by meme f on 22/04/1443 AH.
//

import Foundation
struct User : Codable{
    var id:Int
    var name : String
    var username : String
    var email : String
    var address : Address
    var phone : String
    var website : String
    var company : Company
}

