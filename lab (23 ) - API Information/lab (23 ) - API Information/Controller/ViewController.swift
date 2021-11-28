//
//  ViewController.swift
//  lab (23 ) - API Information
//
//  Created by grand ahmad on 20/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dataTableView: UITableView!
    var listArr = [Information]()
    var selectInformation: Information!
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTableView.dataSource = self
        dataTableView.delegate = self
        getData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let distenationVC = segue.destination as! DetailsViewController
        distenationVC.selectInformation = selectInformation
    }
     
    func getData(){
        let baseURL = "https://jsonplaceholder.typicode.com/users"
        if let ur1 = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: ur1) { data, response, error in
                if let error = error {
                    print("Error", error.localizedDescription)
                } else {
                    if let safeDate = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode([Information].self, from: safeDate)
                            print("decord data",decodedData[0])
                            self.listArr = decodedData
                            DispatchQueue.main.async {
                            self.dataTableView.reloadData()
                    }
                        } catch {
                            print("SOMETHING WENT WRONG", error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text =  "\(listArr[indexPath.row].id)"
        content.secondaryText =  listArr[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        cell.contentConfiguration = content
     return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectInformation = listArr[indexPath.row]
        performSegue(withIdentifier: "VC2", sender: self)
    }
}
