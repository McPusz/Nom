//
//  FoodTruckContentCell.swift
//  Nom
//
//  Created by Magdusz on 23.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import UIKit

class FoodTruckContentCell: UITableViewCell {

    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var telephoneNumberLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    
    fileprivate var viewModel = DayViewModel()
    
    var dayNumber: Int!
    var foodTruckIndex: IndexPath!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTableView()
    }
    
    func configure(cellProtocol: DayFoodTruckCellProtocol, dayNumber: Int, indexPath: IndexPath) {
        telephoneLabel.text = "Telefon: "
        telephoneNumberLabel.text = cellProtocol.getDayFoodTruckNumber(dayNumber: dayNumber, indexPath: indexPath)
        self.setupLayout()
        self.tableView.reloadData()
    }

}

extension FoodTruckContentCell: UITableViewDataSource, UITableViewDelegate {
    
    fileprivate func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MealCell", bundle: nil), forCellReuseIdentifier: "MealCell")
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 140
    }
 
    override func updateConstraints() {
        super.updateConstraints()
        tableHeightConstraint.constant = tableView.contentSize.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getMealsNumber(dayNumber: dayNumber, foodTruckIndex: foodTruckIndex)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell") as! MealCell
        cell.dayNumber = dayNumber
        cell.configure(cellProtocol: viewModel, dayNumber: dayNumber, foodTruckIndex: foodTruckIndex, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
      
    }
}

//MARK: Layout
extension FoodTruckContentCell {
    
    fileprivate func setupLayout() {
        let color = viewModel.getDayColor(dayNumber: dayNumber)
        self.backgroundColor = UIColor(hexString: Color.getDarkColor(colorType: color))
        self.telephoneLabel.font = telephoneLabel.font.withSize(16)
        self.telephoneNumberLabel.font = telephoneNumberLabel.font.withSize(16)
        self.telephoneLabel.textColor = UIColor(hexString: Color.getLightColors(colorType: color))
        self.telephoneNumberLabel.textColor = UIColor(hexString: Color.getWhiteColor(colorType: color))
        
    }
    
}
