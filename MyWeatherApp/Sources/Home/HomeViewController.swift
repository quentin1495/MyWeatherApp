//
//  HomeViewController.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 02/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!

    lazy var viewModel: HomeViewModel = {
        let coreDataStack = CoreDataStack()
        let context = coreDataStack.mainContext
        let weatherRepository = WeatherRepository()
        guard let weathers = weatherRepository.fetch(with: .list) else {
            fatalError("weathers doesn't exists")
        }
        weathers.delegate = self
        return HomeViewModel(weathers: weathers)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        initViewModel()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.homeToDetailsSegueIdentifier,
            let selectedIndexPath = tableView.indexPathForSelectedRow,
            let detailsTableViewController = segue.destination as? DetailsViewController {
            let path = selectedIndexPath
            let day = viewModel.dataSource.object(at: path).day
            detailsTableViewController.configureDay(for: day ?? "")
        }
    }

    fileprivate func initViewModel() {
        viewModel.tableViewDidSelectRowAt = { [weak self] indexPath in
            guard let strongSelf = self else { return }
            strongSelf.tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    func viewModelForWeather(at indexPath: IndexPath) -> HomeTableCellViewModel {
        let weather = viewModel.dataSource.object(at: indexPath)
        return HomeTableCellViewModel(weather: weather)
    }
}
