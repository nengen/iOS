//
//  blurEffect.swift
//  weatherFinder
//
//  Created by Nils-erik Engen on 25/09/2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView
{
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        blurEffectView.alpha = 0.2
        blurEffectView.frame = self.bounds
        vibrancyView.frame = blurEffectView.frame
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        
        blurEffectView.contentView.addSubview(vibrancyView)
        self.addSubview(blurEffectView)
    }
    
    
}
