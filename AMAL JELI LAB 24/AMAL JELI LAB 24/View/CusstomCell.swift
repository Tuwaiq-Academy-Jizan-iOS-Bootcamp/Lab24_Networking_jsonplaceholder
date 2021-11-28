//
//  CusstomCell.swift
//  AMAL JELI LAB 24
//
//  Created by Amal Jeli on 22/04/1443 AH.
//

import Foundation
import UIKit

class CusstomCell:UITableViewCell {
   
    @IBOutlet weak var IDLabel: UILabel!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    
    
    @IBOutlet weak var AddresLabel: UILabel!
    
    @IBOutlet weak var PhoneLabel: UILabel!
    
    
    @IBOutlet weak var WebsiteLabel: UILabel!
    
    @IBOutlet weak var CompanyLebal: UILabel!
    
    @IBOutlet weak var GeoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
