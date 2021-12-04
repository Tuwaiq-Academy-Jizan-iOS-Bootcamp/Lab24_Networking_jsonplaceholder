//
//  ViewController.swift
//  dahmajaber_Lab24_Networking_jsonplaceholder
//
//  Created by dahma alwani on 25/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var personal = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        gitData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func gitData () {
        //  URL
        if let url = URL(string:"https://jsonplaceholder.typicode.com/users"){
            //  URL SESSION
            let session = URLSession(configuration: .default)
            //  TASK
            let task = session.dataTask(with: url) { data , response, error in
                if let error = error {
                    print("errooor101" ,error.localizedDescription)
                }else{
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            self.personal = try decoder.decode([Person].self, from: data)
                            DispatchQueue.main.async{
                                self.tableView.reloadData()
                            }
                        } catch {
                            print("errooorr404", error.localizedDescription)
                        }
                    }
                }
            }
            //  RESUM TASK
            task.resume()
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personal.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellTable
        cell.lableId.text = "\(personal[indexPath.row].id) "
        cell.labelName.text = personal[indexPath.row].name
        cell.labelUserName.text = personal[indexPath.row].username
        cell.labelEmail.text = personal[indexPath.row].email
        cell.labelAddress.text = "\(personal[indexPath.row].address)"
        cell.labelPhone.text = personal[indexPath.row].phone
        cell.labelWebsite.text = personal[indexPath.row].website
        cell.labelCompany.text = "\(personal[indexPath.row].company.name)"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 550
    }
    
    
}

