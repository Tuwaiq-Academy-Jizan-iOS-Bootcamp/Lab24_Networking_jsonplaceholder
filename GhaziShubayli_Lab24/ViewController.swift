//
//  ViewController.swift
//  GhaziShubayli_Lab24
//
//  Created by ماك بوك on 08/05/1443 AH.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var personInfoTableView: UITableView!
    
    var jsonPersonInfo = [PesronInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadPersonData("https://jsonplaceholder.typicode.com/users")
        personInfoTableView.delegate = self
        personInfoTableView.dataSource = self
    }
    func downloadPersonData(_ FromURL: String) {
        if let personData = URL(string: FromURL) {
            let urlSession = URLSession(configuration: .default)
            let urlTask = urlSession.dataTask(with: personData) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let jsonPersonData = data {
                        do {
                            let decorder = JSONDecoder()
                            self.jsonPersonInfo = try decorder.decode([PesronInfo].self, from: jsonPersonData)
                            DispatchQueue.main.async {
                                self.personInfoTableView.reloadData()
                            }
                        }catch {
                            print("Somthing Wrongs In the JSON Struct")
                        }
                    }
                }
            }
            urlTask.resume()
        }
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonPersonInfo.count
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personCell = personInfoTableView.dequeueReusableCell(withIdentifier: "cell") as! TopicInfoCell
        personCell.iD.text = "ID: \(jsonPersonInfo[indexPath.row].id)"
        personCell.name.text = "Name: \(jsonPersonInfo[indexPath.row].name)"
        personCell.userName.text = "Username: \(jsonPersonInfo[indexPath.row].username)"
        personCell.email.text = "Email: \(jsonPersonInfo[indexPath.row].email)"
        personCell.address.text = "Address: \(jsonPersonInfo[indexPath.row].address.suite), \(jsonPersonInfo[indexPath.row].address.city), \(jsonPersonInfo[indexPath.row].address.street), \(jsonPersonInfo[indexPath.row].address.zipcode)"
        personCell.geo.text = "Geo: \(jsonPersonInfo[indexPath.row].address.geo.lat) - \(jsonPersonInfo[indexPath.row].address.geo.lng)"
        personCell.phone.text = "Phone: \(jsonPersonInfo[indexPath.row].phone)"
        personCell.website.text = "Website: \(jsonPersonInfo[indexPath.row].website)"
        personCell.company.text = "Company: \(jsonPersonInfo[indexPath.row].company.name), \(jsonPersonInfo[indexPath.row].company.catchPhrase), \(jsonPersonInfo[indexPath.row].company.bs)"
        return personCell
    }
}
