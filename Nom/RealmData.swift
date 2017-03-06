//
//  RealmData.swift
//  Nom
//
//  Created by Magdusz on 04.03.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmData {
    
    static func getHindusMealsData() -> (names: [String], prices: [String], ingredients: [String]) {
        let names = ["Chicken Vindaloo", "Butter Chicken", "Chicken Korma", "Rajma Masala", "Chicken Palak", "Chicken Tikka Masala", "Chana Masala"]
        let prices = ["12/15", "12/15", "12/15", "12/15", "12/15", "12/15", "12/15"]
        let ingredients = ["Ostry 5/5: Pierś z kurczaka w ostrym sosie curry z ryżem basmati.", "Ostry 1/5: Pierś z kurczaka w sosie maślano-pomidorowym z ryżem basmati.", "Ostry 2/5: Pierś z kurczaka w sosie jogurtowo-kokosowym z ryżem basmati.",  "Ostry 2/5: Czerwona fasolka w gęstym sosie pomidorowym z ryżem basmati.", "Ostry 3/5: Pierś z kurczaka w indyjskim sosie szpinakowym z ryżem basmati.", "Ostry 4/5: Pierś z kurczaka w sosie tikka masala z ryżem basmati.", "Ostry 2/5: Ciecierzyca w pomidorowym sosie curry z ryżem basmati."]
        return (names, prices, ingredients)
    }
    
    static func getManufakturaMealsData() -> (names: [String], prices: [String], ingredients: [String]) {
        let names = ["Burger classic", "Cheeseburger", "Burger wiejski", "Krak burger", "Black Jack", "Frytki belgijskie"]
        let prices = ["17", "18", "21", "22", "31", "7/9"]
        let ingredients = ["Bułka jasna, majonez, sałata, mięso wołowe, pomidor, cebula, ketchup", "Bułka jasna, majonez, ogórek, sałata, mięso wołowe, ser cheddar, pomidor, cebula, ketchup", "Bułka pełnoziarnista, majonez, ogórek, sałata, mięso wołowe, ser wędzony, bekon, placek ziemniaczany, pomidor, cebula, ketchup, jajko",  "HOT. Bułka jasna, majonez, ogórek, sałata, mięso wołowe, ser cheddar, bekon, papryczki jalapeño, pomidor, cebula, sos ognisty", "Burger ze wszytkimi dodatkami", "180/300g + sos (miodowo-musztardowy, barbecue, ognisty, żurawinowy, majonezowo-koperkowy, majonez"]
        return (names, prices, ingredients)
    }

    static func getPizzaMealsData() -> (names: [String], prices: [String], ingredients: [String]) {
        let names = ["Margherita", "Capri", "Salami", "Salami Plus", "Hawaja", "Wege", "Ostry Rocco", "Maxi", "Mięsna"]
        let prices = ["13/22", "14/25", "14/25", "14/25", "15/27", "15/27", "16/28", "16/30", "17/32"]
        let ingredients = ["27/42 cm. Sos, mozarella, rukola", "27/42 cm. Sos, mozarella, szynka, pieczarki", "27/42 cm. Sos, mozarella, 2x salami", "27/42 cm. Sos, mozarella, salami, pieczarki", "27/42 cm. Sos, mozarella, szynka ananas", "27/42 cm. Sos, mozarella, kukurydza, pomidor, rukola", "27/42 cm. Sos, mozarella, salami, jalapeño, cebula", "27/42 cm. Sos, mozarella, salami, szynka, pieczarki", "27/42 cm. Sos, mozarella, salami, szynka, pieczarki, boczek, cebula"]
        return (names, prices, ingredients)
    }

    static func getMajorMealsData() -> (names: [String], prices: [String], ingredients: [String]) {
        let names = ["Klasyk", "Ser", "Chłop", "Baba", "Francuz", "Major", "Kurczak w pomidorach", "Kurczak w pieczarkach", "Grek", "Pierogi"]
        let prices = ["13,50", "14,50", "16", "16", "16", "18", "16", "16", "18", "10"]
        let ingredients = ["Wołowina, sałata, czerwona cebula, pomidor, pikle, ketchup, majonez, bułka", "Wołowina, ser cheddar, sałata, czerwona cebula, pomidor, pikle, ketchup, majonez, bułka", "Wołowina, ser cheddar, bekon, sałata, czerwona cebula, pomidor, pikle, ketchup, sos BBQ, bułka", "Wołowina, ser wędzony, żurawina, karmelizowana cebula, sałata, rukola, ketchup, bułka", "Wołowina, ser pleśniowy, karmelizowana cebula, pomidor, sałata, rukola, ketchup, bułka", "Wołowina, ser cheddar, bekon, papryka marynowana, papryka peperoni, sałata, karmelizowana cebula, pomidor, ketchup, sos cayenne (ostry), bułka", "Filet z piersi kurczaka, ser mozarella, suszone pomidory, czerwona cebula, pesto, sałata, rukola, ketchup, majonez, bułka", "Filet z piersi kurczaka w curry, ser cheddar, pieczarki duszone, bekon, czerwona cebula, sałata, ketchup, majonez, bułka", "Wołowina, tzatziki, ser feta, cebula czerwona, pomidor, sałata, ketchup, bułka", "10 sztuk: ruskie, z mięsem, ze szpinakiem, z pieczarkami, z kapustą i grzybami, Gajowego - kasza, grzyby, boczek"]
        return (names, prices, ingredients)
    }
    
    static func getOwcaMealsData() -> (names: [String], prices: [String], ingredients: [String]) {
        let names = ["Owca w biegu", "Owca na wypasie", "Owca vege"]
        let prices = ["10/18", "22", "10/15"]
        let ingredients = ["Kefta z mięsa jagnięcego, sos pomidorowo-kolendrowy z ciecierzycą, sałata z dwoma rodzajami sosów jogurtowych (pikantnym i sezamowo cytrynowym), grillowana pita", "Kefta z mięsa jagnięcego, falafele, sos pomidorowo-kolendrowy z ciecierzycą, sałata z dwoma rodzajami sosów jogurtowych (pikantnym i sezamowo cytrynowym), grillowana pita", "Falafele, sos pomidorowo-kolendrowy z ciecierzycą, sałata z dwoma rodzajami sosów jogurtowych (pikantnym i sezamowo cytrynowym), grillowana pita"]
        return (names, prices, ingredients)
    }
    
    static func getFoodTrucksData() -> (names: [String], phones: [String], meals: [[MealModel]]) {
        let names = ["Hindus", "Manufaktura Krakowska", "Pizza z pieca", "Major Catering", "Rozbrykana Owca"]
        let phones = ["", "518 527 253", "", "692 830 954", ""]
        let meals = [RealmManager.getMeals(mealNames: getHindusMealsData().names), RealmManager.getMeals(mealNames: getManufakturaMealsData().names), RealmManager.getMeals(mealNames: getPizzaMealsData().names), RealmManager.getMeals(mealNames: getMajorMealsData().names), RealmManager.getMeals(mealNames: getOwcaMealsData().names)]
        return (names, phones, meals)
    }
    
    static func getDaysData() -> (names: [String], colors: [String], foodTrucks: [[FoodTruckModel]]) {
        let names = ["Poniedziałek", "Wtorek", "Środa", "Czwartek", "Piątek"]
        let colors = [DayColors.blue.rawValue, DayColors.orange.rawValue, DayColors.purple.rawValue, DayColors.green.rawValue, DayColors.red.rawValue]
        let foodTrucks = [RealmManager.getFoodTrucks(foodTruckNames: ["Hindus", "Pizza z pieca", "Major Catering"]),RealmManager.getFoodTrucks(foodTruckNames: ["Hindus", "Pizza z pieca", "Major Catering"]), RealmManager.getFoodTrucks(foodTruckNames: ["Hindus", "Pizza z pieca", "Major Catering"]), RealmManager.getFoodTrucks(foodTruckNames: ["Manufaktura Krakowska", "Pizza z pieca", "Major Catering", "Rozbrykana Owca"]), RealmManager.getFoodTrucks(foodTruckNames: ["Hindus", "Pizza z pieca", "Major Catering"])]
         return (names, colors, foodTrucks)
    }
}
