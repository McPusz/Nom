//
//  FoodTruckMainCell.swift
//  Nom
//
//  Created by Magdusz on 23.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import UIKit

class FoodTruckMainCell: UITableViewCell {

    @IBOutlet weak var foodTruckNameLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    private let viewModel = DayViewModel()
    var dayNumber: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(cellProtocol: DayFoodTruckCellProtocol, dayNumber: Int, indexPath: IndexPath){
        foodTruckNameLabel.text = cellProtocol.getDayFoodTrucksNames(dayNumber: dayNumber, indexPath: indexPath)
    }
    
    func setExpandedCellLayout(isExpanded: Bool) {
        let color = viewModel.getDayColor(dayNumber: dayNumber)
        foodTruckNameLabel.textColor = UIColor.white
        if isExpanded {
            print("expanded layout")
            arrowImage.image = #imageLiteral(resourceName: "arrow_up").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            arrowImage.tintColor = UIColor(hexString: Color.getLightColors(colorType: color))
            foodTruckNameLabel.font = foodTruckNameLabel.font.withSize(35)
            self.backgroundColor = UIColor(hexString: Color.getDarkColor(colorType: color))
            
        } else {
            print("collapsed layout")
            arrowImage.image = #imageLiteral(resourceName: "arrow_down").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            arrowImage.tintColor = UIColor(hexString: Color.getMidColor(colorType: color))
            foodTruckNameLabel.font = foodTruckNameLabel.font.withSize(25)
            self.backgroundColor = UIColor(hexString: Color.getLightColors(colorType: color))
        }
    }
}
