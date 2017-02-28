//
//  MealCell.swift
//  Nom
//
//  Created by Magdusz on 23.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {

    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var mealPriceLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(cellProtocol: MealCellProtocol, dayNumber: Int, foodTruckIndex: IndexPath, indexPath: IndexPath) {
        mealNameLabel.text = cellProtocol.getMealName(dayNumber: dayNumber, foodTruckIndex: foodTruckIndex, indexPath: indexPath)
        mealPriceLabel.text = cellProtocol.getMealPrice(dayNumber: dayNumber, foodTruckIndex: foodTruckIndex, indexPath: indexPath)
        ingredientsLabel.text = cellProtocol.getMealIngredients(dayNumber: dayNumber, foodTruckIndex: foodTruckIndex, indexPath: indexPath)
    }
    
}
