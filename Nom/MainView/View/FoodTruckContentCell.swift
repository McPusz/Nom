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
    
    
    fileprivate var viewModel = DayViewModel()
    
    var dayNumber: Int!
    var foodTruckIndex: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTableView()
    }
    
    func configure(cellProtocol: DayFoodTruckCellProtocol, dayNumber: Int, indexPath: IndexPath) {
        telephoneLabel.text = cellProtocol.getDayFoodTruckNumber(dayNumber: dayNumber, indexPath: indexPath)
    }
}

extension FoodTruckContentCell: UITableViewDataSource, UITableViewDelegate {
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MealCell", bundle: nil), forCellReuseIdentifier: "MealCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80.0
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getMealsNumber(dayNumber: dayNumber, foodTruckIndex: foodTruckIndex)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell") as! MealCell
        cell.configure(cellProtocol: viewModel, dayNumber: dayNumber, foodTruckIndex: foodTruckIndex, indexPath: indexPath)
        return cell
    }
}
