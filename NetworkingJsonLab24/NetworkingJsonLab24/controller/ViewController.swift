//
//  ViewController.swift
//  NetworkingJsonLab24
//
//  Created by layla hakami on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var personTableView: UITableView!{
        
        didSet{
            
           personTableView.delegate = self
          personTableView.dataSource = self
        }
    }
    
    var personalArray:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gitData()
    }

    func gitData(){
if let url1 = URL(string: "https://jsonplaceholder.typicode.com/users")
        {
            
    let session = URLSession(configuration: .default)
    
let task = session.dataTask(with: url1) { data, response, error in
                if let error = error {
                    print("ERROR",error.localizedDescription)
                    
                }else{
                    if let safeData = data{
                        do {
                            let decoder = JSONDecoder()
                            let decoderData = try decoder.decode([Person].self, from: safeData)
                            self.personalArray = decoderData
                            print(self.personalArray)
                            DispatchQueue.main.async {
                                self.personTableView.reloadData()

                            }
                             
                        } catch {
                            print("errrorrr",error.localizedDescription)
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
        return personalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DetilsTableViewCell
        DispatchQueue.main.async {
cell.idLabelTableViewCell.text = String(self.personalArray[indexPath.row].id)
cell.nameLabelTableViewCell.text = self.personalArray[indexPath.row].name
cell.userNameLabelTableViewCell.text = self.personalArray[indexPath.row].username
cell.emailLabelTableViewCell.text = self.personalArray[indexPath.row].email
cell.addresslLabelTableViewCell.text = "\(self.personalArray[indexPath.row].address)"
cell.phonelLabelTableViewCell.text = self.personalArray[indexPath.row].phone
cell.websitelLabelTableViewCell.text = self.personalArray[indexPath.row].website
cell.companylLabelTableViewCell.text = "\(self.personalArray[indexPath.row].company)"
            
        }
  return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
}
    
    
    
    



