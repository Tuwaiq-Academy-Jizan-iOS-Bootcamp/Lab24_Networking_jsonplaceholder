//
//  PersonModel.swift
//  HananSomily_jsonplaceholder
//
//  Created by Hanan Somily on 27/11/2021.
//

import Foundation

struct Person:Codable{
        var id: Int
    var idString:String {
        return String (id)
    }
        var name: String
        var username : String
        var email : String
        var address : Address
   var phone :String
        var website : String
    var company : Company
}
struct Address:Codable{
     var street: String
          var suite : String
          var city : String
          var zipcode : String
          var geo : Geo
}
struct Geo:Codable{
    var lat : String
    var lng : String
}
struct Company:Codable{
    var name: String
    var catchPhrase: String
    var bs : String
}
