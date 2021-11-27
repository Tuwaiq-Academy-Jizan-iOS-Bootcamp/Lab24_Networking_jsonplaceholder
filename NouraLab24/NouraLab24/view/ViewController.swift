//
//  ViewController.swift
//  NouraLab24
//
//  Created by NoON .. on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataTableView: UITableView!
    {
        didSet {
            dataTableView.delegate = self
            dataTableView.dataSource = self
        }
    }
    var pesrsonal = [Pesrsonal]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(with: "/users")
    }
    func getData(with endPoint:String){
        let baseURL = "https://jsonplaceholder.typicode.com"
        print("is thes colled??")
        // step1
        if let url = URL(string: baseURL + endPoint){
            print("WAS THE URL IN CORRECT FORMAT")
        // step2
            let session = URLSession(configuration: .default)
        // step3
            let task = session.dataTask(with: url) { data, response,error in
                if let error = error {
                    print("ERROR",error.localizedDescription)
                }else{
                    print("DOWE HAVE DATA",data)
                    if let safeData = data{
                        do{
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode([Pesrsonal].self, from: safeData)
                            DispatchQueue.main.async {
                                self.pesrsonal = decodedData
                                self.dataTableView.reloadData()
                            }
                            print("DECODED DATA",decodedData[0])
                        } catch{
                            print("SOMETHING WENT WRONG",error.localizedDescription)
                        }
                    }
                }

}
            task.resume()

    }
}
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pesrsonal.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! WelcomeTableViewCell
        cell.nameLabel.text = pesrsonal[indexPath.row].name
        cell.userNameLabel.text = pesrsonal[indexPath.row].username
        cell.phoneLabel.text = pesrsonal[indexPath.row].phone
        cell.addressLabel.text = "\(pesrsonal[indexPath.row].address)"
        cell.emailLabel.text = pesrsonal[indexPath.row].email
        cell.websiteLabel.text = pesrsonal[indexPath.row].website
        cell.compnyLabel.text = "\(pesrsonal[indexPath.row].company)"
        cell.idLabel.text = "\(pesrsonal[indexPath.row].id)"
        cell.geoLabel.text = "\(pesrsonal[indexPath.row].address.geo)"
        
     return cell
}
    func tableView(_ tableView: UITableView, heightForRowAt
                   indexPath: IndexPath)
    -> CGFloat {
        return 500
    }
}
