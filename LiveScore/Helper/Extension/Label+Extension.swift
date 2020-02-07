//
//  Label+Extension.swift
//  BabyCare
//
//  Created by HOANPV on 9/20/18.
//  Copyright © 2018 nava. All rights reserved.
//

import UIKit

extension UILabel
{
    func adjustsFontSizeToFitWidth()
    {
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.2
    }
    func setLabelDefault() {
        self.font = UIFont.systemFont(ofSize: 15)
        self.textColor = #colorLiteral(red: 0.6397605538, green: 0.6402581334, blue: 0.639837563, alpha: 1)
    }
    
}
extension UIButton
{
    func adjustsFontSizeToFitWidth()
    {
        self.titleLabel?.numberOfLines = 1;
        self.titleLabel?.adjustsFontSizeToFitWidth = true;
        self.titleLabel?.lineBreakMode = .byClipping;
    }
}

