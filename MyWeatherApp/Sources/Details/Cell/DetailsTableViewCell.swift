//
//  DetailsTableViewCell.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 05/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet private weak var hourLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var titleDescriptionLabel: UILabel!

    private var viewModel: DetailsTableCellViewModel? {
        didSet {
            updateUI()
        }
    }

    func configure(with viewModel: DetailsTableCellViewModel) {
        self.viewModel = viewModel
    }

    private func updateUI() {
        guard let viewModel = viewModel, let image = viewModel.dataSource.image else {
            return
        }
        titleDescriptionLabel.text = viewModel.dataSource.titleDescription
        temperatureLabel.text = "\(viewModel.dataSource.temperature) °c"
        hourLabel.text = viewModel.dataSource.date?.getcompleteHourInString
        iconImageView.image = UIImage(data: image)
        humidityLabel.text = "Humidity: \(viewModel.dataSource.humidity) %"
        windSpeedLabel.text = "Wind speed: \(viewModel.dataSource.windSpeed) km/hr"
    }
}
