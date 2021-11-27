//
//  ViewController.swift
//  ahlam_lab24
//
//  Created by Ahlam Ahlam on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infoTableView: UITableView!{
    didSet{
        infoTableView.delegate = self
        infoTableView.dataSource = self
    }
    
}

var personArray:[Info] = []
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  gitData()
}
func gitData(){
    if let url = URL(string: "https://jsonplaceholder.typicode.com/users") {
        
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { data, response, error in
        if let error = error {
           print("ERROR",error.localizedDescription)
       }else{
           if let safeData = data{
               do {
               let decoder = JSONDecoder()
                   let decoderData = try decoder.decode([Info].self, from: safeData)
                   self.personArray = decoderData
                   print(self.personArray)
                   DispatchQueue.main.async {
                           self.infoTableView.reloadData()
                                           }
               } catch  {
                   print("SOMTHING WRONG",error.localizedDescription)
               }
            }
          }
        }
        task.resume()
    }
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return  personArray.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! InfoCell
    DispatchQueue.main.async {
        cell.name.text = self.personArray[indexPath.row].name
        cell.id.text =  String(self.personArray[indexPath.row].id)
        cell.email.text =  self.personArray[indexPath.row].email
        cell.address.text = "\(self.personArray[indexPath.row].address)"
        cell.company.text =  "\(self.personArray[indexPath.row].company)"
        cell.phone.text =  self.personArray[indexPath.row].phone
        cell.userName.text =  self.personArray[indexPath.row].username
        cell.website.text =  self.personArray[indexPath.row].website
    }
    
  return cell
}
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 450
}

}

