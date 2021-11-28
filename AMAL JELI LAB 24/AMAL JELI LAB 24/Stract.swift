//
//  Stract.swift
//  AMAL JELI LAB 24
//
//  Created by Amal Jeli on 22/04/1443 AH.
//

import Foundation
// Global(information)
struct InformaionPerson: Codable {
    var id : Int
    var name:String
    var username:String
    var email: String
    var phone:String
    var website :String
    var address: Address
    var company: company
}

//Address
struct Address: Codable{
    var street:String
    var suite:String
    var city:String
    var zipcode:String
    var geo: Geo
}
   
//Geo
struct Geo:Codable {
    var lat:String
    var lng : String
}


//Company
struct company :Codable {
    var name:String
    var catchPhrase:String
    var bs: String
}


typealias Hello = [InformaionPerson]
