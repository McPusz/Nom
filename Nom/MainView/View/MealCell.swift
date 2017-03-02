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
    
    var dayNumber: Int!
    fileprivate let viewModel = DayViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(cellProtocol: MealCellProtocol, dayNumber: Int, foodTruckIndex: IndexPath, indexPath: IndexPath) {
        mealNameLabel.text = cellProtocol.getMealName(dayNumber: dayNumber, foodTruckIndex: foodTruckIndex, indexPath: indexPath)
        mealPriceLabel.text = cellProtocol.getMealPrice(dayNumber: dayNumber, foodTruckIndex: foodTruckIndex, indexPath: indexPath)
        ingredientsLabel.text = cellProtocol.getMealIngredients(dayNumber: dayNumber, foodTruckIndex: foodTruckIndex, indexPath: indexPath)
        setupLayout()
    }
    
}

extension MealCell {
    
    fileprivate func setupLayout() {
        let color = viewModel.getDayColor(dayNumber: dayNumber)
        
        mealNameLabel.font = mealNameLabel.font.withSize(23)
        mealPriceLabel.font = mealPriceLabel.font.withSize(23)
        ingredientsLabel.font = ingredientsLabel.font.withSize(15)
        
        mealNameLabel.textColor = UIColor(hexString: Color.getWhiteColor(colorType: color))
        mealPriceLabel.textColor = UIColor(hexString: Color.getWhiteColor(colorType: color))
        ingredientsLabel.textColor = UIColor(hexString: Color.getLightColors(colorType: color))
        currencyLabel.textColor = UIColor(hexString: Color.getWhiteColor(colorType: color))
        
    }
}
