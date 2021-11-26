//
//  ViewController.swift
//  Ehab_Lab24
//
//  Created by Ehab Hakami on 21/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MyTableView: UITableView!
    
    var informationApi = [InformationPerson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData(with: "/users")
        MyTableView.delegate = self
        MyTableView.dataSource = self
        
    }
    
    func getData(with endPoint:String){
        print("Is this called??")
        let baseURL = "https://jsonplaceholder.typicode.com"
        // 1. create url
        if let url = URL(string: baseURL + endPoint) {
            print("WAS THE URL IN CORRECT FORMAT")
            //2. create a URL Session
            let session = URLSession(configuration: .default)
            //3 create a task
            let task = session.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print("ERROR",error.localizedDescription)
                }else {
                    print("DO WE HAVE DATA",data)
                    if let safeData = data {
    //                        print(String(data: safeData, encoding: .utf8))
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode([InformationPerson].self, from: safeData)
                            print("DECODED DATA",decodedData[0])
                            
                            for ele in decodedData {
                                print(ele.name)
                            }
                            
                            self.informationApi = decodedData
                            DispatchQueue.main.async {
                              
                                self.MyTableView.reloadData()
                                
                            }
                            
                        } catch {
                            print("SOMETHING WENT WRONG",error.localizedDescription)
                        }
                        
                    }
                }
            }
            //4. start/resume the task
            task.resume()
        }
        
        
    }
     


}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informationApi.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCusstomTableViewCell
        
        cell.LabelForID.text = "\(informationApi[indexPath.row].id)"
        cell.labelForName.text = informationApi[indexPath.row].name
        cell.labelForUsername.text = informationApi[indexPath.row].username
        cell.labelForEmail.text = informationApi[indexPath.row].email
        cell.labelForPhone.text = informationApi[indexPath.row].phone
        cell.labelForWebsite.text = informationApi[indexPath.row].website
        cell.labelForCompany.text = "\(informationApi[indexPath.row].company)"
        cell.labelForGeo.text = "\(informationApi[indexPath.row].address.geo)"
        
        cell.labelForAddres.text = "\(informationApi[indexPath.row].address)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 265
    }


}


