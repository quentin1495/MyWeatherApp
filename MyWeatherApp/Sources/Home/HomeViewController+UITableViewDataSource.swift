//
//  HomeViewController+UITableViewDataSource.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 07/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.dataSource.sections?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = viewModel.dataSource.sections else {
            fatalError("No sections in viewModel.dataSource")
        }
        let numberOfObjects = sections[section].numberOfObjects
        return numberOfObjects
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellHomeIdentifier, for: indexPath)
            as? HomeTableViewCell else {
                fatalError("Can't load : home tableViewCell")
        }
        cell.configure(with: viewModelForWeather(at: indexPath))

        return cell
    }
}
