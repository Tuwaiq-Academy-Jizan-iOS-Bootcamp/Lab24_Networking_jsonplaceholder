//
//  ViewController.swift
//  HananSomily_jsonplaceholder
//
//  Created by Hanan Somily on 27/11/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var personTabelView: UITableView!{
        didSet{
            personTabelView.delegate = self
            personTabelView.dataSource = self
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    var namep = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getURL(with: "/users")
    }
    var personArray = [Person]()
func getURL(with endpoint:String){
    let link = "https://jsonplaceholder.typicode.com"
   // "https://jsonplaceholder.typicode.com"
    if let url = URL(string: link + endpoint) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { [self] (data, response, error) in
            if let error = error {
                print("ERROR",error.localizedDescription)
            }else {
                print("DO WE HAVE DATA",data)
                if let safeData = data{
                    do{
                let decoder = JSONDecoder()
            let decoderData = try decoder.decode([Person].self, from: safeData)
                        DispatchQueue.main.async {
                            nameLabel.text = decoderData[0].name
                            phoneLabel.text = decoderData[0].phone
                            cityLabel.text = decoderData[0].address.city
                            idLabel.text = decoderData[0].idString
                            self.personArray = decoderData
                            self.personTabelView.reloadData()
                        }
                        print("Data" , decoderData[0])
                    }catch {
                    print("somthing wrong ", error.localizedDescription)
                    }
                  }
                }
            }
            task.resume()
        }
    }
        
}
extension ViewController:UITableViewDelegate {
    
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "modeCell") as! TabelViewModel
        let content = personArray[indexPath.row]
        cell.printDetel(name: content.name, phone: content.phone,
                        iD: content.idString,
                        city: content.address.city)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "modeCell", for: indexPath)
//
//        var content = cell.defaultContentConfiguration()
//        content.text = personArray[indexPath.row].name
//        content.secondaryText = personArray[indexPath.row].phone
        
        cell.accessoryType = .disclosureIndicator
      // cell.contentConfiguration = content

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        namep = personArray[indexPath.row].name
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
}
