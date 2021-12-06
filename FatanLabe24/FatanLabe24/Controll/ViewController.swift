//
//  ViewController.swift
//  FatanLabe24
//
//  Created by Faten Abdullh salem on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    var users = [Pesrsonl]()
@IBOutlet weak var dataTableView: UITableView!
    
    var pesrsonal = [Pesrsonl]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTableView.delegate = self
        dataTableView.dataSource = self
        getData(with:"/users")
    }
    
    
    
    
    func getData(with endPoint:String){
     let baseURL = "https://jsonplaceholder.typicode.com"
    print("is thes colled??")
    // Step1
     if let url = URL(string: baseURL + endPoint){
        print("WAS THE URL IN CORRECT FORMAT")
    // Step2
      let session = URLSession(configuration: .default)
    // Step3
    let task = session.dataTask(with: url) { data, response,error in
       if let error = error {
      print("ERROR",error.localizedDescription)
         }else{
          print("DOWE HAVE DATA",data)
          if let safeData = data{
           do{
    
            let decoder = JSONDecoder()
            let decodeData = try
              decoder.decode([Pesrsonl].self, from: safeData)
               
                 DispatchQueue.main.async {
               // self.Pesrsonl = decodeData
                     self.users = decodeData
                     self.dataTableView.reloadData()

                     
               }
               print("DECODED DATA",decodeData[0])
                    } catch{
                print("SOMETHING WENT WRONG",error.localizedDescription)
         }
    
       }
  
    }
}
            task.resume()
         }
       }
    
    
}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
    return users.count
}
 func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WelcomeTableViewCell
     
    cell.idLabel.text = "\(users[indexPath.row].id)"
    cell.nameLabel.text = users[indexPath.row].name
    cell.userNameLabel.text = users[indexPath.row].username
    cell.emailLabel.text = users[indexPath.row].email
    cell.addressLabel.text = "\(users[indexPath.row].address)"
    cell.phoneLabel.text = users[indexPath.row].phone
    cell.websiteLabel.text = users[indexPath.row].website
    cell.companyLabel.text = "\(users[indexPath.row].company)"
    cell.geoLabel.text = "\(users[indexPath.row].address.geo)"
     
     
     
return cell
    
}
    
    
func tableView(_ tableView: UITableView, heightForRowAt indexPath:IndexPath)->CGFloat {
    return 500
}
}



