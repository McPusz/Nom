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
            self.foodTruckNameLabel.font = self.foodTruckNameLabel.font.withSize(35)
            self.foodTruckNameLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            arrowImage.image = #imageLiteral(resourceName: "arrow_up").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            //animation
            UIView.animate(withDuration: 0.3, animations: {
//                self.arrowImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.foodTruckNameLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            arrowImage.tintColor = UIColor(hexString: Color.getLightColors(colorType: color))
            self.backgroundColor = UIColor(hexString: Color.getDarkColor(colorType: color))
            
        } else {
            arrowImage.image = #imageLiteral(resourceName: "arrow_down").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            arrowImage.tintColor = UIColor(hexString: Color.getMidColor(colorType: color))
            foodTruckNameLabel.font = foodTruckNameLabel.font.withSize(25)
            self.backgroundColor = UIColor(hexString: Color.getLightColors(colorType: color))
        }
    }
}
