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
        //meals
        createMeals(names: RealmData.getHindusMealsData().names, prices: RealmData.getHindusMealsData().prices, ingredients: RealmData.getHindusMealsData().ingredients)
        createMeals(names: RealmData.getManufakturaMealsData().names, prices: RealmData.getManufakturaMealsData().prices, ingredients: RealmData.getManufakturaMealsData().ingredients)
        createMeals(names: RealmData.getPizzaMealsData().names, prices: RealmData.getPizzaMealsData().prices, ingredients: RealmData.getPizzaMealsData().ingredients)
        createMeals(names: RealmData.getMajorMealsData().names, prices: RealmData.getMajorMealsData().prices, ingredients: RealmData.getMajorMealsData().ingredients)
        createMeals(names: RealmData.getOwcaMealsData().names, prices: RealmData.getOwcaMealsData().prices, ingredients: RealmData.getOwcaMealsData().ingredients)
        //food trucks
        createFoodTrucks(names: RealmData.getFoodTrucksData().names, phones: RealmData.getFoodTrucksData().phones, meals: RealmData.getFoodTrucksData().meals)
        //days
        createDays(names: RealmData.getDaysData().names, colors: RealmData.getDaysData().colors, foodTrucks: RealmData.getDaysData().foodTrucks)
    }
    
    private static func createMeals(names: [String], prices: [String], ingredients: [String]) {
        if !((names.count == prices.count) && (prices.count == ingredients.count)) {
            print("creating meals array error")
            return
        }
        
        for i in 0..<names.count {
            let meal = MealModel(value: [names[i], prices[i], ingredients[i]])
            try! realm().write {
                realm().add(meal)
            }
        }
    }
    
    static func getMeals(mealNames: [String]) -> [MealModel] {
        var meals = [MealModel]()
        for name in mealNames {
            let meal = realm().object(ofType: MealModel.self, forPrimaryKey: name) ?? MealModel()
            meals.append(meal)
        }
        return meals
    }
    
    private static func createFoodTrucks(names: [String], phones: [String], meals: [[MealModel]]) {
        if !((names.count == phones.count) && (phones.count == meals.count)) {
            print("creating meals array error")
            return
        }
        
        for i in 0..<names.count {
            let foodTruck = FoodTruckModel(value: [names[i], phones[i], meals[i]])
            try! realm().write {
                realm().add(foodTruck)
            }
        }
    }
    
    static func getFoodTrucks(foodTruckNames: [String]) -> [FoodTruckModel] {
        var foodTrucks = [FoodTruckModel]()
        for name in foodTruckNames {
            let foodTruck = realm().object(ofType: FoodTruckModel.self, forPrimaryKey: name) ?? FoodTruckModel()
            foodTrucks.append(foodTruck)
        }
        return foodTrucks
    }

    private static func createDays(names: [String], colors: [String], foodTrucks: [[FoodTruckModel]]) {
        if !((names.count == colors.count) && (colors.count == foodTrucks.count)) {
            print("creating meals array error")
            return
        }
        
        for i in 0..<names.count {
            let day = DayModel(value: [names[i], colors[i], foodTrucks[i]])
            try! realm().write {
                realm().add(day)
            }
        }
    }
}

