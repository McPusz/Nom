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
    var model = [DayModel()]
    
    init() {
        let realm = try! Realm()
        model = Array(realm.objects(DayModel.self))
    }
    
    func getDayName(dayNumber: Int) -> String {
        return model[dayNumber].day
    }
    
    func getDayFoodtrucks(dayNumber: Int) -> [FoodTruckModel] {
        return Array(model[dayNumber].foodTrucks)
    }
    
    func getNumberOfDays() -> Int {
        return model.count
    }
}
