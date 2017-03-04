//
//  FoodTruckViewModel.swift
//  Nom
//
//  Created by Magdusz on 25.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import Foundation
import RealmSwift


extension DayViewModel: DayFoodTruckCellProtocol {
    
    func getDayFoodTrucksNames(dayNumber: Int, indexPath: IndexPath) -> String {
        return model[dayNumber].foodTrucks[indexPath.section].name
    }
    
    func getDayFoodTruckNumber(dayNumber: Int, indexPath: IndexPath) -> String? {
        return model[dayNumber].foodTrucks[indexPath.section].phone
    }
    
}

protocol DayFoodTruckCellProtocol {
    func getDayFoodTrucksNames(dayNumber: Int, indexPath: IndexPath) -> String
    func getDayFoodTruckNumber(dayNumber: Int, indexPath: IndexPath) -> String?
}
