//
//  UIView+Extension.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import UIKit

extension UIView{
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat, borderColor:CGColor?) {
        
        self.layer.masksToBounds = true
        let bounds = self.bounds
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.frame = bounds
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func makeCircleView(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.layer.frame.size.width / 2
    }
    func setViewRadius() {
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.clear.cgColor
    }
    func setDefaultView() {
        self.layer.cornerRadius = 0
        self.layer.borderColor = UIColor.clear.cgColor
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
   
    
}
