//
//  PharmaciesViewController.swift
//  JobEspresso
//
//  Created by 謝飛飛 on 2020/4/5.
//  Copyright © 2020 MarkFly. All rights reserved.
//

import UIKit

let cellIdentifier = "cell"

class PharmaciesViewController: UITableViewController
{
    let viewModel = PharmaciesViewModel()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        viewModel.fetchPharmacies()
        viewModel.completionHandler =
        {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { viewModel.countrys.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let country = viewModel.countrys[indexPath.row]
        cell.textLabel?.text = "\(indexPath.row + 1).\(country): \(viewModel.pharmaciesResult[country] ?? 0)"
        return cell
    }
}
