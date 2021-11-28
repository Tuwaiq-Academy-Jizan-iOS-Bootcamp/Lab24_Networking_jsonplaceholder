//
//  TabelViewModel.swift
//  HananSomily_jsonplaceholder
//
//  Created by Hanan Somily on 27/11/2021.
//

import Foundation
import UIKit

class TabelViewModel:UITableViewCell{
    
    @IBOutlet weak var namePersonLabel: UILabel!
    @IBOutlet weak var phonPersonLabel: UILabel!
    @IBOutlet weak var cityPersonLabel: UILabel!
    @IBOutlet weak var idPersonLabel: UILabel!
    var person : Person?
    override func awakeFromNib() {
        super.awakeFromNib()
        namePersonLabel.text = person?.name
        phonPersonLabel.text = person?.phone
        cityPersonLabel.text = person?.address.city
        idPersonLabel.text = person?.idString
    }
    func printDetel (name:String , phone:String , iD:String , city:String){
        namePersonLabel.text = name
        phonPersonLabel.text = phone
        cityPersonLabel.text = city
        idPersonLabel.text = iD
    }
}
