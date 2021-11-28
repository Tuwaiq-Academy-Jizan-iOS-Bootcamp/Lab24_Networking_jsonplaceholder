//
//  ViewController.swift
//  DoaaAlagee_lab24_jsonplaceholder
//
//  Created by Dua'a ageel on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    var thePersonInfo = [PesronInfo]()
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadPersonData("https://jsonplaceholder.typicode.com/users")
        myTableView.delegate = self
        myTableView.dataSource = self
        
    }

    func downloadPersonData(_ FromURL: String) {
             if let personData = URL(string: FromURL) {
                 let urlSession = URLSession(configuration: .default)
                 let urlTask = urlSession.dataTask(with: personData) { data, response, error in
                     if let error = error {
                         print("error", error.localizedDescription)
                     }else {
                         if let jsonPersonData = data {
                             do {
                                 let decorder = JSONDecoder()
                                 self.thePersonInfo = try decorder.decode([PesronInfo].self, from: jsonPersonData)
                                 DispatchQueue.main.async {
                                     self.myTableView.reloadData()
                                 }
                             }catch {
                                 print("something went wronr")
                             }
                         }
                     }
                 }
                 urlTask.resume()
             }
         }
     }

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return thePersonInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! MyTVC
        
        
        
        cell.nameLable.text = thePersonInfo[indexPath.row].name
                
                 cell.phoneLable.text = thePersonInfo[indexPath.row].phone
                 cell.adressLable.text = "\(thePersonInfo[indexPath.row].address)"
                 cell.emailLable.text = thePersonInfo[indexPath.row].email
                 cell.websiteLable.text = thePersonInfo[indexPath.row].website
                 cell.compnyLable.text = "\(thePersonInfo[indexPath.row].company)"
                 cell.idLable.text = "\(thePersonInfo[indexPath.row].id)"
                 cell.geoLable.text = "\(thePersonInfo[indexPath.row].address.geo)"
        
        
        
        
        
        
        
        
        return cell
    }
    
    
    
}
