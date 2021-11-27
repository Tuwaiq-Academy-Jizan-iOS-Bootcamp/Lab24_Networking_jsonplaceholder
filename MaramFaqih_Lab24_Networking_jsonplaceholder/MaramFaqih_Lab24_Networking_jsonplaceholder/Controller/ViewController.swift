//
//  ViewController.swift
//  MaramFaqih_Lab24_Networking_jsonplaceholder
//
//  Created by meme f on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoTV: UITableView!
    var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        infoTV.delegate = self
        infoTV.dataSource = self
        getaData(with:"/users")
    }
    func getaData(with endPoint:String){
        
        let baseURL = "https://jsonplaceholder.typicode.com"
       if let url = URL(string: baseURL+endPoint) {
        let session = URLSession(configuration: .default)
       
        let task = session.dataTask(with: url){ data, respons, error in
            if let error = error {
                print("error",error.localizedDescription)
            }else{
                if let safeData = data {
                    do{
                           let decoder = JSONDecoder()
                          
                           let decoderData = try decoder.decode([User].self, from: safeData)
                           
                           print("decoderData:",decoderData )
                               DispatchQueue.main.async {
                                   self.users = decoderData
                                   self.infoTV.reloadData()
                                

    }


} catch{
    print("error f",error.localizedDescription)

               }
           }
       }
    }
           task.resume()
       }
}
}

extension ViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! InfoCell
      
        cell.idLabel.text = String(users[indexPath.row].id)
        cell.nameLabel.text = users[indexPath.row].name
        cell.userNameLabel.text = users[indexPath.row].username
        cell.emailLabel.text = users[indexPath.row].email
        cell.streetLabel.text = users[indexPath.row].address.street
        cell.suiteLabel.text = users[indexPath.row].address.suite
        cell.cityLabel.text = users[indexPath.row].address.city
        cell.zipCodeLabel.text = users[indexPath.row].address.zipcode
        cell.latLabel.text = users[indexPath.row].address.geo.lng
        cell.lngLabel.text = users[indexPath.row].address.geo.lng
        cell.phoneLabel.text = users[indexPath.row].phone
        cell.websiteLabel.text = users[indexPath.row].website
        cell.cNameLabel.text = users[indexPath.row].company.name
        cell.catchPhraseLabel.text = users[indexPath.row].company.catchPhrase
        cell.bsLabel.text = users[indexPath.row].company.bs

        return cell
      
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
        
    }
    
    


}
