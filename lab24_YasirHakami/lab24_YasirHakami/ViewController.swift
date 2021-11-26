//
//  ViewController.swift
//  lab24_YasirHakami
//
//  Created by Yasir Hakami on 26/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var info = [InformationElement]()
    var geo = [Geo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.dataSource = self
        myTableView.delegate = self
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
                            self.info = try decoder.decode([InformationElement].self, from: safeData)
                            print("DECODED DATA", self.info)
                            for element in self.info {
                                print(element.email)
                                
                            }
                            
                            DispatchQueue.main.sync {
                                self.myTableView.reloadData()
                                
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




extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.forId.text = "\(info[indexPath.row].id)"
        cell.forName.text = info[indexPath.row].name
        cell.forUsername.text = info[indexPath.row].username
        cell.forEmail.text = info[indexPath.row].email
        cell.forAddres.text = "\(info[indexPath.row].address)"
        cell.forPhone.text = info[indexPath.row].phone
        cell.forWebsite.text = info[indexPath.row].website
        cell.forCompany.text = "\(info[indexPath.row].company)"
        cell.forGeo.text = "\(info[indexPath.row].address.geo)"
        
        
        
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }


}

