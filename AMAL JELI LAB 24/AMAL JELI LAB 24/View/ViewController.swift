//
//  ViewController.swift
//  AMAL JELI LAB 24
//
//  Created by Amal Jeli on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
    var Informtion = [InformaionPerson]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getData(with: "/users")
        TableView.delegate = self
        TableView.dataSource = self
       
    }
    func getData(with endPoint:String){
        print("")
        let baseURL = "https://jsonplaceholder.typicode.com"
        // 1. create url
        if let url  = URL (string: baseURL + endPoint) {
            print("")
            //2. create a URL Session
            let session = URLSession(configuration: .default)
//            3 create a task
            let task = session .dataTask(with: url) { data ,response , error in
                if let error = error {
                    print ("ERROR",error.localizedDescription)
                    
                }else{
                    print("DO WE HAVE DATA",data)
                    if let safeData = data {
                        
                        do {
                            let decoder = JSONDecoder()
                            let decoderData = try decoder.decode([InformaionPerson].self, from: safeData)
                            print ("DECODED DATA",decoderData[0])
                            
                            
                            for ele in decoderData {
                                print(ele.name)
                            }
                            self.Informtion = decoderData
                            DispatchQueue.main.async {
                                self.TableView.reloadData()
                                
                                
                            }
                            
                        } catch {
                            print ("SOMETHING WRONG",error.localizedDescription)
                        }
                    }
                }
        }
//            4.step : start resum the task
            task.resume()
    }

}

}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Informtion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CusstomCell
        
        cell.IDLabel.text = "\(Informtion[indexPath.row].id)"
        
        cell.NameLabel.text = "\(Informtion[indexPath.row].name)"
        
        cell.UserNameLabel.text = "\(Informtion[indexPath.row].username)"
        
        cell.EmailLabel.text = "\(Informtion[indexPath.row].email)"
        
        cell.AddresLabel.text = "\(Informtion[indexPath.row].address)"
        
        cell.PhoneLabel.text = "\(Informtion[indexPath.row].phone)"
        
        cell.WebsiteLabel.text = "\(Informtion[indexPath.row].website)"
        
        cell.CompanyLebal.text = "\(Informtion[indexPath.row].company)"
//        
//        cell.GeoLabel.text = "\(Informtion[indexPath.row].geo)"
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 250
    }

}
