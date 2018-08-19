//
//  ItemCell.swift
//  Homepwner
//
//  Created by Nils-erik Engen on 27.02.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell{

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    
    func updateLabels(){
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        nameLabel.font = bodyFont
        valueLabel.font = bodyFont
        
        let caption1Font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        serialNumberLabel.font = caption1Font
    }
   
    func updateTextColor(_ value: Int){
    
        if value >= 50 {
        valueLabel.textColor = UIColor.red
        }else{
        valueLabel.textColor = UIColor.green
        }
    
    }
}
