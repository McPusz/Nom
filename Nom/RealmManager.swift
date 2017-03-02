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
            var monday = realm().add(mondayData())
            let thursday = realm().add(thursdayData())
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

        let hindus: [Any?] = ["Hindus", "12 346 67 95", hindusMeals]
        return FoodTruckModel(value: hindus)
    }
    
    private static func manufakturaData() -> FoodTruckModel {
        let manufakturaMeals: [MealModel] = [
            MealModel(value: ["Burger classic", "17", "Bułka jasna, majonez, sałata, mięso wołowe, pomidor, cebula, ketchup"]),
            MealModel(value: ["Cheeseburger", "18", "Bułka jasna, majonez, ogórek, sałata, mięso wołowe, ser cheddar, pomidor, cebula, ketchup"]),
            MealModel(value: ["Burger wiejski", "21", "Bułka pełnoziarnista, majonez, ogórek, sałata, mięso wołowe, ser wędzony, bekon, placek ziemniaczany, pomidor, cebula, ketchup, jajko"]),
            MealModel(value: ["Krak burger", "22", "HOT. Bułka jasna, majonez, ogórek, sałata, mięso wołowe, ser cheddar, bekon, papryczki jalapeño, pomidor, cebula, sos ognisty"]),
            MealModel(value: ["Black Jack", "31", "Burger ze wszytkimi dodatkami"]),
            MealModel(value: ["Frytki belgijskie", "7/9", "180/300g + sos (miodowo-musztardowy, barbecue, ognisty, żurawinowy, majonezowo-koperkowy, majonez"])
            ]
        
        let manufaktura: [Any?] = ["Manufaktura Krakowska", "518 527 253", manufakturaMeals]
        return FoodTruckModel(value: manufaktura)
    }
    
    private static func pizzaZPiecaData() -> FoodTruckModel {
        let pizzaZpiecaMeals: [MealModel] = [
            MealModel(value: ["Margherita", "13/22", "27/42 cm. Sos, mozarella, rukola"]),
            MealModel(value: ["Capri", "14/25", "27/42 cm. Sos, mozarella, szynka, pieczarki"]),
            MealModel(value: ["Salami", "14/25", "27/42 cm. Sos, mozarella, 2x salami"]),
            MealModel(value: ["Salami Plus", "14/25", "27/42 cm. Sos, mozarella, salami, pieczarki"]),
            MealModel(value: ["Hawaja", "15/27", "27/42 cm. Sos, mozarella, szynka ananas"]),
            MealModel(value: ["Wege", "15/27", "27/42 cm. Sos, mozarella, kukurydza, pomidor, rukola"]),
            MealModel(value: ["Ostry Rocco", "16/28", "27/42 cm. Sos, mozarella, salami, jalapeño, cebula"]),
            MealModel(value: ["Maxi", "16/30", "27/42 cm. Sos, mozarella, salami, szynka, pieczarki"]),
            MealModel(value: ["Mięsna", "17/32", "27/42 cm. Sos, mozarella, salami, szynka, pieczarki, boczek, cebula"])
        ]
        
        let pizzaZPieca: [Any?] = ["Pizza z pieca", "", pizzaZpiecaMeals]
        return FoodTruckModel(value: pizzaZPieca)
    }
    
    private static func majorBurgerData() -> FoodTruckModel {
        let majorMeals: [MealModel] = [
            MealModel(value: ["Klasyk", "13,50", "Wołowina, sałata, czerwona cebula, pomidor, pikle, ketchup, majonez, bułka"]),
            MealModel(value: ["Ser", "14,50", "Wołowina, ser cheddar, sałata, czerwona cebula, pomidor, pikle, ketchup, majonez, bułka"]),
            MealModel(value: ["Chłop", "16", "Wołowina, ser cheddar, bekon, sałata, czerwona cebula, pomidor, pikle, ketchup, sos BBQ, bułka"]),
            MealModel(value: ["Baba", "16", "Wołowina, ser wędzony, żurawina, karmelizowana cebula, sałata, rukola, ketchup, bułka"]),
            MealModel(value: ["Francuz", "16", "Wołowina, ser pleśniowy, karmelizowana cebula, pomidor, sałata, rukola, ketchup, bułka"]),
            MealModel(value: ["Major", "18", "Wołowina, ser cheddar, bekon, papryka marynowana, papryka peperoni, sałata, karmelizowana cebula, pomidor, ketchup, sos cayenne (ostry), bułka"]),
            MealModel(value: ["Kurczak w pomidorach", "16", "Filet z piersi kurczaka, ser mozarella, suszone pomidory, czerwona cebula, pesto, sałata, rukola, ketchup, majonez, bułka"]),
            MealModel(value: ["Kurczak w pieczarkach", "16", "Filet z piersi kurczaka w curry, ser cheddar, pieczarki duszone, bekon, czerwona cebula, sałata, ketchup, majonez, bułka"]),
            MealModel(value: ["Grek", "18", "Wołowina, tzatziki, ser feta, cebula czerwona, pomidor, sałata, ketchup, bułka"]),
            MealModel(value: ["Pierogi", "10", "10 sztuk: ruskie, z mięsem, ze szpinakiem, z pieczarkami, z kapustą i grzybami, Gajowego - kasza, grzyby, boczek"])
        ]
        
        let majorBurger: [Any?] = ["Major Catering", "692 830 954", majorMeals]
        return FoodTruckModel(value: majorBurger)
    }
    
    private static func rozbrykanaOwcaData() -> FoodTruckModel {
        let owcaMeals: [MealModel] = [
            MealModel(value: ["Owca w biegu", "10/18", "Kefta z mięsa jagnięcego, sos pomidorowo-kolendrowy z ciecierzycą, sałata z dwoma rodzajami sosów jogurtowych (pikantnym i sezamowo cytrynowym), grillowana pita"]),
            MealModel(value: ["Owca na wypasie", "22", "Kefta z mięsa jagnięcego, falafele, sos pomidorowo-kolendrowy z ciecierzycą, sałata z dwoma rodzajami sosów jogurtowych (pikantnym i sezamowo cytrynowym), grillowana pita"]),
            MealModel(value: ["Owca vege", "10/15", "Falafele, sos pomidorowo-kolendrowy z ciecierzycą, sałata z dwoma rodzajami sosów jogurtowych (pikantnym i sezamowo cytrynowym), grillowana pita"])
        ]
        
        let rozbrykanaOwca: [Any?] = ["Rozbrykana Owca", "514 387 953", owcaMeals]
        return FoodTruckModel(value: rozbrykanaOwca)
    }
    
    
    //FIXME: prepare more data
    private static func mondayData() -> DayModel {
        var foodTrucks: [FoodTruckModel] = [hindusData()]
        let m = DayModel()
        m.day = "Poniedziałek"
        m.dayColor = DayColors.blue.rawValue
        m.foodTrucks = List(foodTrucks)
        let monday: [Any?] = ["Poniedziałek", foodTrucks, DayColors.blue.rawValue]
//        return DayModel(value: monday)
        return m
    }
    
    private static func thursdayData() -> DayModel {
        let foodTrucks: [FoodTruckModel] = [manufakturaData(), pizzaZPiecaData(), majorBurgerData(), rozbrykanaOwcaData()]
        let t = DayModel()
        t.day = "Czwartek"
        t.dayColor = DayColors.orange.rawValue
        t.foodTrucks = List(foodTrucks)
        let thursday: [Any?] = ["Czwartek", foodTrucks, DayColors.orange.rawValue]
//        return DayModel(value: thursday)
        return t
    }
}

