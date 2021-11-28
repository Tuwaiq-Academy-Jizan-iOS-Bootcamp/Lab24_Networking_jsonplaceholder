//
//  Information.swift
//  lab (23 ) - API Information
//
//  Created by grand ahmad on 20/04/1443 AH.
//

/*
 {
     "id": 1,
     "name": "Leanne Graham",
     "username": "Bret",
     "email": "Sincere@april.biz",
     "address": {
       "street": "Kulas Light",
       "suite": "Apt. 556",
       "city": "Gwenborough",
       "zipcode": "92998-3874",
       "geo": {
         "lat": "-37.3159",
         "lng": "81.1496"
       }
     },
     "phone": "1-770-736-8031 x56442",
     "website": "hildegard.org",
     "company": {
       "name": "Romaguera-Crona",
       "catchPhrase": "Multi-layered client-server neural-net",
       "bs": "harness real-time e-markets"
     }
   },
 */

import Foundation
struct Information: Codable{
    var id: Int
    var name: String
    var username:String
    var email: String
    var phone: String
    var website: String
    var company: Company
    var address: Address
}

/*
 "address": {
   "street": "Kulas Light",
   "suite": "Apt. 556",
   "city": "Gwenborough",
   "zipcode": "92998-3874",
   "geo": {
     "lat": "-37.3159",
     "lng": "81.1496"
   }
 },
 */
struct Address: Codable{
    var street:String
    var suite:String
    var city:String
    var zipcode:String
    var geo: Geo
}

struct Geo:Codable{
    var lat:String
    var lng:String
}

struct  Company: Codable{
    var name: String
    var catchPhrase: String
    var bs: String
}
