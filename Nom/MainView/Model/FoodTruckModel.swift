//
//  FoodTruckModel.swift
//  Nom
//
//  Created by Magdusz on 25.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import Foundation
import RealmSwift

class FoodTruckModel: Object {
    dynamic var name: String = ""
    dynamic var phone: String? = nil
    let meals = List<MealModel>()
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
