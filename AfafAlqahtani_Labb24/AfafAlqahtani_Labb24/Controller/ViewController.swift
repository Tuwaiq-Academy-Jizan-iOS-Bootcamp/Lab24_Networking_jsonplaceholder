//
//  ViewController.swift
//  AfafAlqahtani_Labb24
//
//  Created by Afaf Yahya on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewPerson: UITableView!
    var person = [Person] ()
    override func viewDidLoad() {
        super.viewDidLoad()
            tableViewPerson.delegate = self
            tableViewPerson.dataSource = self
        
     getData()
    }
    func getData() {
        let baseURL = "https://jsonplaceholder.typicode.com/users"
        if let url = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("ERROR",error.localizedDescription)
                }else {
                    print("DO WE HAVE DATA",data)
                    
                    if let safeData = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode([Person].self, from: safeData)
                            self.person = decodedData
                            
                            DispatchQueue.main.async {
                                self.tableViewPerson.reloadData()
                            
                            }
                            } catch {
                            print("SOMETHING WENT WRONG",error.localizedDescription)
                        }
                        
                    }
                }
            }
            task.resume()
        }
      }
    
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellViewController
        cell.viewId.text = "\(person[indexPath.row].id)"
        cell.viewName.text = person[indexPath.row].name
        cell.viewUsername.text = person[indexPath.row].username
        cell.viewEmail.text = person[indexPath.row].email
        cell.viewAdress.text =  "\(person[indexPath.row].address)"
        cell.viewPhone.text = person[indexPath.row].phone
        cell.viewWepsiste.text = person[indexPath.row].website
        cell.viewCompany.text = "\(person[indexPath.row].company)"
        cell.viewGeo.text = person[indexPath.row].address.geo.lng
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
}

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//    didSet {
//        tableViewPerson.delegate = self
//        tableViewPerson.dataSource = self
//    }
//}
//    
//    var person: [Person] = []
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//        
//        gitDate()
//    }
//    func gitData() {
//        if let url = URL(string: "https://jsonplaceholder.typicode.com/users") {
//            
//            let sission = URLSession(configuration: .default)
//            let task = sission.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    print("Error",error.localizedDescription)
//                }else {
//                    if let safeDta = data {
//                        do {
//                            let decoder = JSONEncoder()
//                            let decoderData = try decoder.decode([Person].self, from: safeDta)
//                            self.person = decoderData
//                            print(self.person)
//                            DispatchQueue.main.async {
//                                self.tableViewPerson.reloadData()
//                                         }
//                            } catch {
//                                print("SOMTHING WRONG",error.localizedDescription)
//                            }
//                        }
//                    }
//                }
//                task.resume()
//            }
//        }
//        
//extension ViewController : UITableViewDelegate, UITableViewDelegate {
//    func tableView( tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//    }
//}
//
//
//}

