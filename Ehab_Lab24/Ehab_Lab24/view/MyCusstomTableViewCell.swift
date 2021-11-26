//
//  MyCusstomTableViewCell.swift
//  Ehab_Lab24
//
//  Created by Ehab Hakami on 21/04/1443 AH.
//

import UIKit

class MyCusstomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var LabelForID: UILabel!
    
    @IBOutlet weak var labelForName: UILabel!
    
    @IBOutlet weak var labelForUsername: UILabel!
    
    @IBOutlet weak var labelForEmail: UILabel!
    
    @IBOutlet weak var labelForAddres: UILabel!
    
    @IBOutlet weak var labelForPhone: UILabel!
    
    @IBOutlet weak var labelForWebsite: UILabel!
    
    @IBOutlet weak var labelForCompany: UILabel!
    
    @IBOutlet weak var labelForGeo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
