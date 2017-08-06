//
//  Window+FWextent.swift
//  FreeWeddingApp
//
//  Created by 张天琛 on 2017/6/19.
//  Copyright © 2017年 sc. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    class func imageWith(_ color: UIColor) -> UIImage
    {
        let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage!
    }
}
