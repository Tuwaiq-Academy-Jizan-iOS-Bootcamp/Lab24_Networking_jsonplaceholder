//
//  ViewController.swift
//  Bushra Barakat_Lab24
//
//  Created by Bushra Barakat on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var persons: [Person] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData(with:"/users")
        tableView.dataSource = self
        tableView.delegate = self
    }
    func getData(with endPoint: String){
        print ("is this work??")
        
    let baseURL = "https://jsonplaceholder.typicode.com/users"
        if let url = URL(string: "https://jsonplaceholder.typicode.com/users" ){
            print("was the URL in correct format")

            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("ERROR", error.localizedDescription)
                }else{
                    print ("dowe have data",data)
                    if let safeData = data {
                        print(String(data:safeData, encoding: .utf8))
                        do{
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode([Person].self, from: safeData)
                            DispatchQueue.main.async {
                                self.persons = decodedData
                                self.tableView.reloadData()
                            }
                        } catch {
                            print("somthing wrong", String(describing: error))
                        }
                    }
                }
            }
            task.resume()

        }
    }
}


extension ViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellViewController
        cell.idLabel.text = "\(persons[indexPath.row].id)"
        cell.nameLabel.text = persons[indexPath.row].name
        cell.userNameLabel.text = persons[indexPath.row].username
        cell.emailLabel.text = persons[indexPath.row].email
        cell.addressStreetLabel.text = persons[indexPath.row].address.street
        cell.addressSuiteLabel.text = persons[indexPath.row].address.suite
        cell.addressCityLabel.text = persons[indexPath.row].address.city
        cell.addressZipcodeLabel.text = persons[indexPath.row].address.zipcode
        cell.addressGeoLatLabel.text = persons[indexPath.row].address.geo.lat
        cell.addressGeoLngLabel.text = persons[indexPath.row].address.geo.lng
        cell.phoneLabel.text = persons[indexPath.row].phone
        cell.websiteLabel.text = persons[indexPath.row].website
        cell.companyNameLabel.text = persons[indexPath.row].company.name
        cell.companyCatchPhraseLabel.text = persons[indexPath.row].company.catchPhrase
        cell.companyBsLabel.text = persons[indexPath.row].company.bs
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
}
