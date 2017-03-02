//
//  DayViewController.swift
//  Nom
//
//  Created by Magdusz on 23.02.2017.
//  Copyright © 2017 Magdusz. All rights reserved.
//

import UIKit

enum CellState: Int {
    case Collapsed = 0
    case Expanded
}

class DayViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var dayNumber: Int!
    fileprivate var cellStates = [CellState]()
    fileprivate let viewModel = DayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCellStateForEveryObjectInTable()
        self.setupTable()
        dayNameLabel.text = viewModel.getDayName(dayNumber: dayNumber)
        self.setupLayout()
    }

    private func setCellStateForEveryObjectInTable() {
        for _ in 0...viewModel.getDayFoodTrucksNumber(dayNumber: dayNumber) {
            cellStates.append(.Collapsed)
        }
    }
}

extension DayViewController: UITableViewDataSource, UITableViewDelegate {
    
    fileprivate func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        //UI-Nibs ----------
        tableView.register(UINib(nibName: "FoodTruckMainCell", bundle: nil), forCellReuseIdentifier: "FoodTruckMainCell")
        tableView.register(UINib(nibName: "FoodTruckContentCell", bundle: nil), forCellReuseIdentifier: "FoodTruckContentCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.getDayFoodTrucksNumber(dayNumber: dayNumber)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if cellStates[section] == .Expanded {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTruckMainCell") as! FoodTruckMainCell
            cell.dayNumber = dayNumber
            
            if cellStates[indexPath.section] == .Collapsed{
                cell.setExpandedCellLayout(isExpanded: false)
            }else{
                cell.setExpandedCellLayout(isExpanded: true)
            }
            cell.configure(cellProtocol: viewModel, dayNumber: dayNumber, indexPath: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTruckContentCell") as! FoodTruckContentCell
            cell.dayNumber = dayNumber
            cell.foodTruckIndex = indexPath
            cell.configure(cellProtocol: viewModel, dayNumber: dayNumber, indexPath: indexPath)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = self.tableView.cellForRow(at: indexPath) as? FoodTruckMainCell {
            
            let addRow = IndexPath(row: 1, section: indexPath.section)
            self.tableView.beginUpdates()
            if cellStates[indexPath.section] == .Collapsed{
                self.tableView.insertRows(at: [addRow], with: .fade)
                cell.setExpandedCellLayout(isExpanded: true)
                cellStates[indexPath.section] = .Expanded
            }else{
                self.tableView.deleteRows(at: [addRow], with: .fade)
                cell.setExpandedCellLayout(isExpanded: false)
                cellStates[indexPath.section] = .Collapsed
            }
            self.tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

//MARK: Layout
extension DayViewController {
    
    fileprivate func setupLayout() {
        let color = viewModel.getDayColor(dayNumber: dayNumber)
        backgroundView.backgroundColor = UIColor(hexString: Color.getMidColor(colorType: color))
        dayNameLabel.textColor = UIColor.white
    }
}
