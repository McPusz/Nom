//
//  MealModel.swift
//  Nom
//
//  Created by Magdusz on 25.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import Foundation
import RealmSwift

class MealModel: Object {
    dynamic var name: String = ""
    dynamic var price: String = ""
    dynamic var ingredients: String? = nil
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
