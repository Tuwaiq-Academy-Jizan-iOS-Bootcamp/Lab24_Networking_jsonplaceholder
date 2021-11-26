//
//  JsonAPI.swift
//  yousef_almalki_lab24
//
//  Created by يوسف جابر المالكي on 22/04/1443 AH.
//


//  (1)creat URL
//  (2)creat URL session
//  (3)creat task
//  (4)creat task resume
import Foundation
struct JsonAPI {
    
    func fetchJson(){
       let urlString = "https://jsonplaceholder.typicode.com/users"
        let url = URL(string: urlString)
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with:url!) { data, response, error in
            if error != nil{
                print(error?.localizedDescription)
            }else{
                do {
                    let structJSONElemnt = try JSONDecoder().decode(Element.self, from: data!)
                    print(structJSONElemnt.id)
                    print(structJSONElemnt.name)
                    print(structJSONElemnt.address)
                    print(structJSONElemnt.company)
                    print(structJSONElemnt.email)
                    print(structJSONElemnt.phone)
                    print(structJSONElemnt.username)
                    print(structJSONElemnt.website)
                } catch{
                    print(error)
                }
            }
        }
        task.resume()
    }
    
}
