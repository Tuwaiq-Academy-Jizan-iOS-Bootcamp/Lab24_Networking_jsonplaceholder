//
//  DetailsViewController.swift
//  lab (23 ) - API Information
//
//  Created by grand ahmad on 22/04/1443 AH.
//

import Foundation
import UIKit
class DetailsViewController: UIViewController {
    @IBOutlet weak var detailsTableView: UITableView!
    
    var selectInformation: Information!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView.dataSource = self
        detailsTableView.delegate = self
    }
}

extension DetailsViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 6
        } else if section == 1 {
            return 3
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        } else if section == 1 {
            return "Company"
        } else {
            return "Address"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        /*
         var id: Int
         var name: String
         var username:String
         var email: String
         var phone: String
         var website: String
         */
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                content.text =  "\(selectInformation.id)"
            }
            if indexPath.row == 1 {
                content.text =  selectInformation.name
            }
            if indexPath.row == 2 {
                content.text =  selectInformation.username
            }
            if indexPath.row == 3 {
                content.text =  selectInformation.email
            }
            if indexPath.row == 4 {
                content.text =  selectInformation.phone
            }
            if indexPath.row == 5 {
                content.text =  selectInformation.website
            }
        } else if indexPath.section == 1 {
            /*
             var name: String
             var catchPhrase: String
             var bs: String
             */
            if indexPath.row == 0 {
                content.text =  selectInformation.company.name
            }
            if indexPath.row == 1 {
                content.text =  selectInformation.company.catchPhrase
            }
            if indexPath.row == 2 {
                content.text =  selectInformation.company.bs
            }
        } else {
            /*
             var street:String
             var suite:String
             var city:String
             var zipcode:String
             var geo: Geo
             */
            if indexPath.row == 0 {
                content.text =  selectInformation.address.street
            }
            if indexPath.row == 1 {
                content.text =  selectInformation.address.suite
            }
            if indexPath.row == 2 {
                content.text =  selectInformation.address.city
            }
            if indexPath.row == 3 {
                content.text =  selectInformation.address.zipcode
            }
            if indexPath.row == 4 {
                content.text = "Lat: " + selectInformation.address.geo.lat + " Lng: " + selectInformation.address.geo.lng
            }
        }
        cell.contentConfiguration = content
     return cell
    }
    
    
}
