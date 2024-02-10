//
//  ExtensionUIColor.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 01/02/24.
//

import UIKit

extension UIColor {
    
    static let appColor = AppColor()
    
    static func rgb(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
        UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    struct AppColor {
        let primary:UIColor = .rgb(r: 59, g: 133, b: 111)
    }
}
