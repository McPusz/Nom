//
//  FoodTruckViewModel.swift
//  Nom
//
//  Created by Magdusz on 25.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import Foundation
import RealmSwift

class FoodTruckViewModel: FoodTruckCellProtocol {
    var model = [FoodTruckModel()]
    
    init() {
        let realm = try! Realm()
        model = Array(realm.objects(FoodTruckModel.self))
    }
    
    func getFoodTruckName(indexPath: IndexPath) -> String {
        return model[indexPath.row].name
    }
    
    func getFoodTruckPhone(indexPath: IndexPath) -> String? {
        return model[indexPath.row].phone
    }
    
    func getFoodTruckMeals(indexPath:IndexPath) -> [MealModel] {
        return Array(model[indexPath.row].meals)
    }
    
    func getFoodTrucksNumber() -> Int {
        return model.count
    }
}

protocol FoodTruckCellProtocol {
    func getFoodTruckName(indexPath: IndexPath) -> String
    func getFoodTruckPhone(indexPath: IndexPath) -> String?
    func getFoodTruckMeals(indexPath:IndexPath) -> [MealModel]
}
