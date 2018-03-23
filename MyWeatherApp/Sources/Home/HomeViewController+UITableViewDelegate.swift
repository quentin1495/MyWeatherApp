//
//  HomeViewController+UITableViewDelegate.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 07/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.tableViewDidSelectRow(at: indexPath)
    }
}
