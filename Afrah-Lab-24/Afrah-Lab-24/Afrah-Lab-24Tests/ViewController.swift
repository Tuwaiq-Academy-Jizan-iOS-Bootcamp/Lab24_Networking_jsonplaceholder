//
//  ViewController.swift
//  Afrah-Lab-24
//
//  Created by Afrah Omar on 22/04/1443 AH.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tabelViewData: UITableView! {
        didSet {
            tabelViewData.delegate = self
            tabelViewData.dataSource = self
        }
    }
    
    
    var personal :[Person] = []
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
        gitData()
    }
    func gitData() {
        // 1. create url
    if let url = URL(string: "https://jsonplaceholder.typicode.com/users") {
        //2. create a URL Session
           let session = URLSession(configuration: .default)
        //3 create a task
           let task = session.dataTask(with: url) { data, response, error in
               if let error = error {
                  print("ERROR",error.localizedDescription)
              }else{
                  if let safeData = data{
                      do {
                      let decoder = JSONDecoder()
                          let decoderData = try decoder.decode([Person].self, from: safeData)
                          self.personal = decoderData
                          print(self.personal)
                          DispatchQueue.main.async {
                                  self.tabelViewData.reloadData()
                                                  }
                      } catch  {
                          print("SOMTHING WRONG",error.localizedDescription)
                      }
                   }
                 }
               }
        //4. start/resume the task
               task.resume()
           }
           }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellTabelView
        cell.idLabel.text = "\(personal[indexPath.row].id)"
        cell.nameLabel.text = personal[indexPath.row].name
        cell.usernameLabel.text = personal[indexPath.row].username
        cell.emilLabel.text = personal[indexPath.row].email
        cell.addressLabel.text = "\(personal[indexPath.row].address)\n"
        cell.phoneLabel.text = personal[indexPath.row].phone
        cell.websiteLabel.text = personal[indexPath.row].website
        cell.companyLabel.text = "\(personal[indexPath.row].company)"
        
        return cell 
    
    
}
    func tableView(_ tableView: UITableView, heightForRowAt
                      indexPath: IndexPath)
       -> CGFloat {
           return 350
}
}
