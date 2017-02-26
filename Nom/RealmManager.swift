//
//  RealmManager.swift
//  Nom
//
//  Created by Magdusz on 25.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmManager {
    
    private static let realm = { return try! Realm() }

    static func checkIfRealmIsEmpty() {
        if realm().isEmpty {
            createDatabase()
        }
    }
    
    private static func createDatabase() {
        try! realm().write() {
            var hindus = realm().create(hindusData())
        }
    }
    
    private static func hindusData() -> FoodTruckModel {
        
        let hindusMeals: [MealModel] = [
            MealModel(value: ["Chicken Vindaloo", "12/15", "Ostry 5/5: Pierś z kurczaka w ostrym sosie curry z ryżem basmati."]),
            MealModel(value: ["Butter Chicken", "11/14", "Ostry 1/5: Pierś z kurczaka w sosie maślano-pomidorowym z ryżem basmati."]),
            MealModel(value: ["Chicken Korma", "12/15", "Ostry 2/5: Pierś z kurczaka w sosie jogurtowo-kokosowym z ryżem basmati."]),
            MealModel(value: ["Rajma Masala", "11/14", "Ostry 2/5: Czerwona fasolka w gęstym sosie pomidorowym z ryżem basmati."]),
            MealModel(value: ["Chicken Palak", "12/15", "Ostry 3/5: Pierś z kurczaka w indyjskim sosie szpinakowym z ryżem basmati."]),
            MealModel(value: ["Chicken Tikka Masala", "12/15", "Ostry 4/5: Pierś z kurczaka w sosie tikka masala z ryżem basmati."]),
            MealModel(value: ["Chana Masala", "11/14", "Ostry 2/5: Ciecierzyca w pomidorowym sosie curry z ryżem basmati."])
        ]

        let hindus = FoodTruckModel(value: ["Hindus", nil, hindusMeals])
        return hindus
    }
}

