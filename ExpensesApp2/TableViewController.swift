//
//  TableViewController.swift
//  ExpensesApp2
//
//  Created by Zachary Pierucci on 1/25/19.
//  Copyright © 2019 Zachary Pierucci. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var expenseTableView: UITableView!
    
    //var expenseArray = [Expense.init(title:"Dinner", amount:32.50, date:"June 1, 2018 18:30"), Expense.init(title:"Office Supplies", amount:59.34, date:"May 30, 2018 12:17"), Expense.init(title:"Uber", amount:16.23, date:"May 30, 2018 11:43"), Expense.init(title:"Coffee", amount:3.95, date:"May 29, 2018 8:45")]
    
    var expenseArray = [Expense]()
    
    var dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "MMMM d, yyyy HH:mm"
        
        if let date = dateFormatter.date(from: "June 1, 2018 18:30"){
            expenseArray.append(Expense(title: "Dinner", amount: 32.50, date: date))
        }
        
        if let date = dateFormatter.date(from: "May 30, 2018 12:17"){
            expenseArray.append(Expense(title: "Office Supplies", amount: 59.34, date: date))
        }
        
        if let date = dateFormatter.date(from: "May 30, 2018 11:43"){
            expenseArray.append(Expense(title: "Uber", amount: 16.23, date: date))
        }
        
        if let date = dateFormatter.date(from: "May 29, 2018 8:45"){
            expenseArray.append(Expense(title: "Coffee", amount: 3.95, date: date))
        }
        
        expenseTableView.dataSource = self
        expenseTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ea = expenseArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let amountHolder = String(format:"%.2f", ea.amount)
        
        cell.titleLabel?.text = ea.title
        cell.amountLabel?.text = "$" + amountHolder
        cell.dateLabel?.text = dateFormatter.string(from: ea.date)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }

}

