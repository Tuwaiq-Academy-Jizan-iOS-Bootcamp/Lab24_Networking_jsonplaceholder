//
//  ViewController.swift
//  ArwaAlattas_Lab24_Networking_jsonplaceholder
//
//  Created by Arwa Alattas on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var personTableView: UITableView!{
        didSet{
            personTableView.delegate = self
            personTableView.dataSource = self
        }
        
    }
    
    var personArray:[Person] = []
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
                       let decoderData = try decoder.decode([Person].self, from: safeData)
                       self.personArray = decoderData
                       print(self.personArray)
                       DispatchQueue.main.async {
                               self.personTableView.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PersonCell
        DispatchQueue.main.async {
            cell.personName.text = self.personArray[indexPath.row].name
            cell.personID.text =  String(self.personArray[indexPath.row].id)
            cell.persomEmail.text =  self.personArray[indexPath.row].email
            cell.personAddrees.text = "street: \(self.personArray[indexPath.row].address.street) ,suite: \(self.personArray[indexPath.row].address.suite) , sity: \(self.personArray[indexPath.row].address.city) , zipcode: \(self.personArray[indexPath.row].address.zipcode) , goe: (lat :\(self.personArray[indexPath.row].address.geo.lat) lng: \(self.personArray[indexPath.row].address.geo.lng))"
            cell.personCompany.text =  " name: \(self.personArray[indexPath.row].company.name), catchPhrase: \(self.personArray[indexPath.row].company.catchPhrase), bs: \(self.personArray[indexPath.row].company.bs)"
            cell.personPhone.text =  self.personArray[indexPath.row].phone
            cell.personUserName.text =  self.personArray[indexPath.row].username
            cell.personWebsite.text =  self.personArray[indexPath.row].website
        }
        
      return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
}
