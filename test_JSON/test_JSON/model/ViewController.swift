//
// viewcontroller.swift
//  Lab24
//
//  Created by زهور حسين on 23/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var arraypersondata :[PersonData] = []
   override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        getData(with: "/users")
    }
        func getData(with endPoint: String){
            print("Is this called")
            let baseURL = "https://jsonplaceholder.typicode.com"
            // 1 STEP
            if let url = URL(string: baseURL + endPoint) {
                print("")
                
                // 2 STEP
                let session = URLSession(configuration: .default)
                //3 STEP
                
                let task = session.dataTask(with: url) { data, response, error in
                    if let error = error {
                        print ("ERROR",error.localizedDescription)
                    }else{
                        print("DO WE HAVE DATA",data)
                        
                        if let safeData = data {
                            
                            do {
                                let decoder = JSONDecoder()
                            let decoderData = try decoder.decode([PersonData].self, from: safeData)
                                print ("DECODED DATA",decoderData[0])
                        
                                self.arraypersondata = decoderData
                                DispatchQueue.main.async{
                                  self.tableview.reloadData()
                                }
                            }  catch{
                                
                                print("SOMETHING WENT WRONG",error.localizedDescription)
                            }
                        }
                    }
                }
                
                task.resume()
            }
        }
        // Do any additional setup after loading the view.
    }
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arraypersondata.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexpath) as! viewCell
         cell.labelName.text = arraypersondata[indexpath.row].name
         cell.labelID.text = "\(arraypersondata[indexpath.row].id)"
         cell.labelUsername.text = arraypersondata[indexpath.row].username
         cell.labelEmail.text = arraypersondata[indexpath.row].email
      cell.labelAddress.text = arraypersondata[indexpath.row].address.city
           cell.labelPhone.text = arraypersondata[indexpath.row].phone
      cell.labelwebsit.text = arraypersondata[indexpath.row].website
    cell.labelCompany.text = arraypersondata[indexpath.row].company.name
       // cell.labelGeo.text = arraypersondata[indexpath.row].geo
        
        return cell
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 600
        }
    }



