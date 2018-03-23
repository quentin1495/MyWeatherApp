//
//  DetailsViewController.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 05/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    private var day: String?

    lazy var viewModel: DetailsViewModel = {
        let coreDataStack = CoreDataStack()
        let weatherRepository = WeatherRepository()
        guard let day = day, let weathers = weatherRepository.fetch(with: .details(forDay: day)) else {
            fatalError("weathers doesn't exists")
        }
        weathers.delegate = self
        return DetailsViewModel(weathers: weathers)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.title = day
    }

    func configureDay(for day: String) {
        self.day = day
    }

    // MARK: - Outputs Cell View Model configuration

    func viewModelForWeather(at indexPath: IndexPath) -> DetailsTableCellViewModel {
        let weather = viewModel.dataSource.object(at: indexPath)
        return DetailsTableCellViewModel(weather: weather)
    }
}
