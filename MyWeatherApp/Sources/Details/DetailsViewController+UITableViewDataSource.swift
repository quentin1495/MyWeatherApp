//
//  DetailsViewController+UITableViewDataSource.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 08/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import UIKit

extension DetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.fetchedObjects?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellDetailsIdentifier, for: indexPath)
            as? DetailsTableViewCell else {
                fatalError("Can't loads : details tableViewCell")
        }
        cell.configure(with: viewModelForWeather(at: indexPath))

        return cell
    }
}
