//
//  ViewController.swift
//  yousef_almalki_lab24
//
//  Created by يوسف جابر المالكي on 21/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var jsonTableView: UITableView!
    var array = ["1","2","3","4"]
    var jsonAPI = JsonAPI()
    override func viewDidLoad() {
        super.viewDidLoad()

        jsonTableView.dataSource = self
        jsonAPI.fetchJson()
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = array[indexPath.row]
        
        
        return cell
    }
    
    
}
