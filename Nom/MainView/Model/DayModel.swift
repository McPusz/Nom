//
//  DayModel.swift
//  Nom
//
//  Created by Magdusz on 25.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import Foundation
import RealmSwift

enum DayColors: String {
    case red
    case blue
    case orange
    case green
    case purple
}

struct Color {
    
    static func getLightColors(colorType: DayColors) -> String {
        switch colorType {
        case .blue:
            return ColorStrings.lightBlue
        case .green:
            return ColorStrings.lightGreen
        case .orange:
            return ColorStrings.lightOrange
        case .purple:
            return ColorStrings.lightPurple
        case .red:
            return ColorStrings.lightRed
        }
    }
    
    static func getMidColor(colorType: DayColors) -> String {
        switch colorType {
        case .blue:
            return ColorStrings.mediumBlue
        case .green:
            return ColorStrings.mediumGreen
        case .orange:
            return ColorStrings.mediumOrange
        case .purple:
            return ColorStrings.mediumPurple
        case .red:
            return ColorStrings.mediumRed
        }
    }
    
    static func getDarkColor(colorType: DayColors) -> String {
        switch colorType {
        case .blue:
            return ColorStrings.darkBlue
        case .green:
            return ColorStrings.darkGreen
        case .orange:
            return ColorStrings.darkOrange
        case .purple:
            return ColorStrings.darkPurple
        case .red:
            return ColorStrings.darkRed
        }
    }
    
    static func getWhiteColor(colorType: DayColors) -> String {
        switch colorType {
        case .blue:
            return ColorStrings.whiteBlue
        case .green:
            return ColorStrings.whiteGreen
        case .orange:
            return ColorStrings.whiteOrange
        case .purple:
            return ColorStrings.whitePurple
        case .red:
            return ColorStrings.whiteRed
        }
    }
    
}

class DayModel: Object {
    dynamic var day: String! = ""
    var foodTrucks = List<FoodTruckModel>()
//    var dayColor: DayColors! = DayColors.blue

    dynamic var dayColor = DayColors.blue.rawValue
    var colorEnum: DayColors {
        get {
            return DayColors(rawValue: dayColor)!
        }
        set {
            dayColor = newValue.rawValue
        }
    }
    
    override static func primaryKey() -> String? {
        return "day"
    }
}
