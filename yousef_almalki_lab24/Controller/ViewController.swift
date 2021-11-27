
//
//  ViewController.swift
//  digmon
//
//  Created by يوسف جابر المالكي on 22/04/1443 AH.
//

import UIKit
class ViewController: UIViewController {
@IBOutlet weak var personTableView: UITableView!
    var details = [Person]()
        var geo = [Geo]()
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            personTableView.delegate = self
            personTableView.dataSource = self
            getData(with: "/users")
        }
        func getData(with endPoint:String){
            let baseURL = "https://jsonplaceholder.typicode.com"
            if let url = URL(string: baseURL + endPoint){
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { data, response, error in
                    if let error = error {
                        print("ERROR", error.localizedDescription)
                    } else {
                        if let safeData = data {
                            do {
                                let decoder = JSONDecoder()
                                self.details = try decoder.decode([Person].self, from: safeData)
                                print("DECODED DATA", self.details)
                                for element in self.details {
                                    print(element.email)
                                }

                                DispatchQueue.main.sync {
                                    self.personTableView.reloadData()
                                }
                            } catch {
                                print("SOMTHING WENT WRRONG!", error.localizedDescription)
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
     return details.count
 }
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = personTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customCellTableViewCell
     cell.IDLable.text = String(details[indexPath.row].id)
     cell.nameLable.text = details[indexPath.row].name
     cell.userNameLable.text = details[indexPath.row].username
     cell.addressLable.text = "\(details[indexPath.row].address)"
     cell.wepsitLable.text = details[indexPath.row].website
     cell.emailLabel.text = details[indexPath.row].email
     cell.companyLable.text = "\(details[indexPath.row].company)"
     cell.geoLable.text = "\(details[indexPath.row].address.geo)"
     cell.lablePhone.text = "\(details[indexPath.row].phone)"
     return cell
 }
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 230
 }
}
