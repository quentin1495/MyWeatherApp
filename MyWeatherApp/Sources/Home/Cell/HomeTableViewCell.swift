//
//  HomeTableViewCell.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 05/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleDescriptionLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var dayLabel: UILabel!

    private var viewModel: HomeTableCellViewModel? {
        didSet {
            updateUI()
        }
    }

    func configure(with viewModel: HomeTableCellViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Private functions

    private func updateUI() {
        guard let viewModel = viewModel, let image = viewModel.dataSource.image else {
            return
        }
        titleDescriptionLabel.text = viewModel.dataSource.titleDescription
        temperatureLabel.text = "\(viewModel.dataSource.temperature) °c"
        dayLabel.text = viewModel.dataSource.day
        iconImageView.image = UIImage(data: image)
    }
}
