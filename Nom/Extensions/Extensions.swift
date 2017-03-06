//
//  UIColorExtension.swift
//  Nom
//
//  Created by Magdusz on 25.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    // You can enter hex strings with either format: #ffffff or ffffff
    convenience init(hexString: String) {
        
        let hex = hexString.trimmingCharacters(in: NSCharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    // var color = UIColor(red: 0xFF, green: 0xFF, blue: 0xFF)
    
    convenience init(netHex: Int) {
        self.init(red: (netHex >> 16) & 0xff, green: (netHex >> 8) & 0xff, blue: netHex & 0xff)
    }
    // var color2 = UIColor(netHex:0xFFFFFF)
    
    convenience init(rgbString: String) {
        
        let rgbStringArray = rgbString.replacingOccurrences(of: ",", with: "").components(separatedBy: " ")
        let a: Int = (rgbStringArray.count > 3) ? Int(rgbStringArray[3]) ?? 1 : 1
        if rgbStringArray.count > 0 {
            if let r = Float(rgbStringArray[0]), let g = Float(rgbStringArray[1]), let b = Float(rgbStringArray[2]) {
                self.init(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: CGFloat(a))
            } else {
                self.init(red: 1, green: 1, blue: 1, alpha: 1)
            }
        } else {
            self.init(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    //var color = UIColor(rgbString: "54 98 172")
}

extension Collection where Indices.Iterator.Element == Index {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Generator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
