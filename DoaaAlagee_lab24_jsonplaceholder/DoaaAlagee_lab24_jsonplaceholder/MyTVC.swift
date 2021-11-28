//
//  MyTVC.swift
//  DoaaAlagee_lab24_jsonplaceholder
//
//  Created by Dua'a ageel on 23/04/1443 AH.
//

import UIKit

class MyTVC: UITableViewCell {
    
    
    @IBOutlet weak var nameLable: UILabel!
    
    
    @IBOutlet weak var phoneLable: UILabel!
    
    @IBOutlet weak var adressLable: UILabel!
    
    @IBOutlet weak var emailLable: UILabel!
    
    @IBOutlet weak var websiteLable: UILabel!
    
    @IBOutlet weak var compnyLable: UILabel!
    
    @IBOutlet weak var idLable: UILabel!
    
    @IBOutlet weak var geoLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
