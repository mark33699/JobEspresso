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
    let activityView = UIActivityIndicatorView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        layoutUI()
        bindingViewModel()
    }

    private func layoutUI()
    {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
        
        view.addSubview(activityView)
        activityView.center = view.center
        activityView.color = .black
        activityView.startAnimating()
    }
    
    private func bindingViewModel()
    {
        viewModel.fetchPharmacies()
        viewModel.completionHandler =
        {
            self.tableView.reloadData()
            self.activityView.isHidden = true
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
