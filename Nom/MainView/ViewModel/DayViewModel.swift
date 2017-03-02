//
//  DayViewModel.swift
//  Nom
//
//  Created by Magdusz on 25.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import Foundation
import RealmSwift

class DayViewModel {
    var model = [DayModel]()
    
    init() {
        RealmManager.checkIfRealmIsEmpty()

        let realm = try! Realm()
        model = Array(realm.objects(DayModel.self))
    }
    
    func getDayName(dayNumber: Int) -> String {
        return model[dayNumber].day
    }
    
    func getDayFoodtrucks(dayNumber: Int) -> [FoodTruckModel] {
        return Array(model[dayNumber].foodTrucks)
    }
    
    func getDayFoodTrucksNumber(dayNumber: Int) -> Int {
        return model[dayNumber].foodTrucks.count
    }
    
    func getDayColor(dayNumber: Int) -> DayColors {
        return DayColors(rawValue: model[dayNumber].dayColor)!
    }

    func getNumberOfDays() -> Int {
        return model.count
    }
}

