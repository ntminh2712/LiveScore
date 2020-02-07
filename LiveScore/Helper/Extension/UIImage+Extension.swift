//
//  UIImage+Extension.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import UIKit
import Kingfisher
import CoreImage
extension UIImage {
    func imageWithColor(color: UIColor) -> UIImage? {
        let image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return image
        }
        return image
    }
    func imageBlackAndWhite() -> UIImage?
    {
        if let beginImage = CoreImage.CIImage(image: self)
        {
            let paramsColor: [String : AnyObject] = [kCIInputBrightnessKey: NSNumber(value: 0.0),
                                                     kCIInputContrastKey:   NSNumber(value: 7.0),
                                                     kCIInputSaturationKey: NSNumber(value: 0.0)]
            let blackAndWhite = beginImage.applyingFilter("CIColorControls", parameters: paramsColor)
            
            let paramsExposure: [String : AnyObject] = [kCIInputEVKey: NSNumber(value: 0.5)]
            let output = blackAndWhite.applyingFilter("CIExposureAdjust", parameters: paramsExposure)
            
            let processedCGImage = CIContext().createCGImage(output, from: output.extent)!
            return UIImage(cgImage: processedCGImage, scale: self.scale, orientation: self.imageOrientation)
        }
        return nil
    }
  
}


extension UIImageView {
    func setCustomImage(_ imgURLString: String?, defaultAvatar: String?) {
        if let url = URL(string: imgURLString ?? "") as? URL
        {
            self.kf.setImage(with: url)
        }else{
            self.image = UIImage(named: "\(defaultAvatar)")
        }
    }
    
    func setImageBackAndWhiteByUrl(_ imgURLString: String?){
        if let url = URL(string: imgURLString ?? "") as? URL
        {
            self.kf.setImage(with: url)
            self.image = self.image?.imageBlackAndWhite()
        }
    }
}
