//
//  PharmaciesViewController.swift
//  JobEspresso
//
//  Created by 謝飛飛 on 2020/4/5.
//  Copyright © 2020 MarkFly. All rights reserved.
//

import UIKit

class PharmaciesViewController: UITableViewController
{
    let viewModel = PharmaciesViewModel()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        viewModel.fetchPharmacies()
        viewModel.completionHandler =
        {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
