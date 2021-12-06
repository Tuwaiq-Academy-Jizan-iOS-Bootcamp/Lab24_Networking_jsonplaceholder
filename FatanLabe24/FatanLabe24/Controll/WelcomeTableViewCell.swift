//
//  WelcomeTableViewCell.swift
//  FatanLabe24
//
//  Created by Faten Abdullh salem on 25/04/1443 AH.
//

import Foundation
import UIKit
class WelcomeTableViewCell:UITableViewCell {
@IBOutlet weak var idLabel: UILabel!
@IBOutlet weak var nameLabel: UILabel!
@IBOutlet weak var userNameLabel: UILabel!
@IBOutlet weak var emailLabel: UILabel!
@IBOutlet weak var addressLabel: UILabel!
@IBOutlet weak var phoneLabel: UILabel!
@IBOutlet weak var websiteLabel: UILabel!
@IBOutlet weak var companyLabel: UILabel!
@IBOutlet weak var geoLabel: UILabel!

override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

