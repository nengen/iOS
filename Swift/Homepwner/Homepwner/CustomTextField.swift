//
//  CustomTextField.swift
//  Homepwner
//
//  Created by Nils-erik Engen on 28.02.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import Foundation
import UIKit

class CustomTextField: UITextField{

    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 0.5
        return true
    }
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.1
        return true
    }

}
