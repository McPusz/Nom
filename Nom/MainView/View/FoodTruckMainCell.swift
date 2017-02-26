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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(cellProtocol: FoodTruckCellProtocol, indexPath: IndexPath){
        foodTruckNameLabel.text = cellProtocol.getFoodTruckName(indexPath: indexPath)
    }
    
    func setExpandedCellLayout(isExpanded: Bool) {
        if isExpanded {
            print("expanded layout")
        } else {
            print("collapsed layout")
        }
    }
}
