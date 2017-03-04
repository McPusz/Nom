//
//  MealViewModel.swift
//  Nom
//
//  Created by Magdusz on 25.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import Foundation
import RealmSwift


extension DayViewModel: MealCellProtocol {
    
    func getMealName(dayNumber: Int, foodTruckIndex: IndexPath, indexPath: IndexPath) -> String {
        return model[dayNumber].foodTrucks[foodTruckIndex.section].meals[indexPath.row].name
    }
    
    func getMealPrice(dayNumber: Int, foodTruckIndex: IndexPath, indexPath: IndexPath) -> String {
        return model[dayNumber].foodTrucks[foodTruckIndex.section].meals[indexPath.row].price
    }
    
    func getMealIngredients(dayNumber: Int, foodTruckIndex: IndexPath, indexPath: IndexPath) -> String? {
        return model[dayNumber].foodTrucks[foodTruckIndex.section].meals[indexPath.row].ingredients
    }

    
    func getMealsNumber(dayNumber: Int, foodTruckIndex: IndexPath) -> Int {
        return model[dayNumber].foodTrucks[foodTruckIndex.section].meals.count
    }
    
    
}

protocol MealCellProtocol {
    func getMealName(dayNumber: Int, foodTruckIndex: IndexPath, indexPath: IndexPath) -> String
    func getMealPrice(dayNumber: Int, foodTruckIndex: IndexPath, indexPath: IndexPath) -> String
    func getMealIngredients(dayNumber: Int, foodTruckIndex: IndexPath, indexPath: IndexPath) -> String?
}
