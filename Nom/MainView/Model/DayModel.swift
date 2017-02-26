//
//  DayModel.swift
//  Nom
//
//  Created by Magdusz on 25.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import Foundation
import RealmSwift

class DayModel: Object {
    dynamic var day: String! = ""
    let foodTrucks = List<FoodTruckModel>()
    
    override static func primaryKey() -> String? {
        return "day"
    }
}
