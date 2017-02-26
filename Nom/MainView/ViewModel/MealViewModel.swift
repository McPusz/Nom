//
//  MealViewModel.swift
//  Nom
//
//  Created by Magdusz on 25.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import Foundation
import RealmSwift

class MealViewModel: MealCellProtocol {
    var model = [MealModel()]
    
    init() {
        let realm = try! Realm()
        model = Array(realm.objects(MealModel.self))
    }
    
    func getMealName(indexPath: IndexPath) -> String {
       return model[indexPath.row].name
    }
    
    func getMealPrice(indexPath: IndexPath) -> String {
        return model[indexPath.row].price
    }
    
    func getMealIngredients(indexPath: IndexPath) -> String? {
        return model[indexPath.row].ingredients
    }
    
    func getMealsNumber() -> Int {
        return model.count
    }
}

protocol MealCellProtocol {
    func getMealName(indexPath: IndexPath) -> String
    func getMealPrice(indexPath: IndexPath) -> String
    func getMealIngredients(indexPath: IndexPath) -> String?
}
