//
//  ViewController.swift
//  JawaherAbuLahsah_Lab24_Networking_jsonplaceholder
//
//  Created by Jawaher Mohammad on 20/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayInfo: UITextView!
    @IBOutlet weak var infoTable: UITableView!
    
    
  var persons = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    //step 1 : retrieve the data from API
    func getData(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        if let url = url {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, respon, error in
                if let error = error {
                    print("ERROR")
                }else{
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let decoderData = try decoder.decode([Person].self, from: data)
                            //display information
                            print(decoderData)
                            self.persons = decoderData
                            DispatchQueue.main.async {
                                //Step 3 : display on complete information on screen
                                self.displayInfo.text = "ID : \(decoderData[0].id)\n"
                                self.displayInfo.text += "Name : \(decoderData[0].name)\n"
                                self.displayInfo.text += "UserName : \(decoderData[0].username)\n"
                                self.displayInfo.text += "Email : \(decoderData[0].email)\n"
                                self.displayInfo.text += "Street : \(decoderData[0].address.street)\n"
                                self.displayInfo.text += "Suite : \(decoderData[0].address.suite)\n"
                                self.displayInfo.text += "City : \(decoderData[0].address.city)\n"
                                self.displayInfo.text += "Zipcode : \(decoderData[0].address.zipcode)\n"
                                self.displayInfo.text += "LAT: \(decoderData[0].address.geo.lat)\n"
                                self.displayInfo.text += "LNG: \(decoderData[0].address.geo.lng)\n"
                                self.displayInfo.text += "Phone : \(decoderData[0].phone)\n"
                                self.displayInfo.text += "Website : \(decoderData[0].website)\n"
                                self.displayInfo.text += "Company name : \(decoderData[0].company.name)\n"
                                self.displayInfo.text += "Catch Phrase : \(decoderData[0].company.catchPhrase)\n"
                                self.displayInfo.text += "BS : \(decoderData[0].company.bs)\n"
                                //step 4 : display information in tableView
                                self.infoTable.reloadData()
                            }
                        } catch {
                            print("SAME ERROR")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = String(persons[indexPath.row].id)
        content.secondaryText = persons[indexPath.row].name + " , " + persons[indexPath.row].phone
        content.secondaryText! += " , " + persons[indexPath.row].address.city
        cell.contentConfiguration = content
        return cell
    }
}
