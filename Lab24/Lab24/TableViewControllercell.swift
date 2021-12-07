//
//  TableViewControllercell.swift
//  Lab24
//
//  Created by زهور حسين on 23/04/1443 AH.
//

import UIKit

class TableViewControllercell: UITableViewCell {
    @IBOutlet weak var labelUsername: UILabel!
    
    @IBOutlet weak var labelGeo: UILabel!
    @IBOutlet weak var labelCompany: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelID: UILabel!
    
    @IBOutlet weak var labelwebsit: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelName: UILabel!
   // @IBOutlet weak var labelName: UILabel!
    var persoon:PersonData?
override func awakeFromNib(){
    super.awakeFromNib()
    labelUsername.text = persoon?.username
    labelCompany.text = persoon?.company.name
    labelAddress.text = persoon?.address.city
    labelEmail.text = persoon?.email
    labelID.text = persoon?.idString
    labelwebsit.text = persoon?.website
    labelPhone.text = persoon?.phone
    labelName.text = persoon?.name
    
//}
// override func setSelected(_ selected: Bool, animated: Bool) {
//      super.setSelected(selected, animated: animated)
//  }
     
}
}
