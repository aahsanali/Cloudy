//
//  DayViewController.swift
//  Cloudy
//
//  Created by Bart Jacobs on 01/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

protocol DayViewControllerDelegate: AnyObject {
    func controllerDidTapSettingsButton(controller: DayViewController)
    func controllerDidTapLocationButton(controller: DayViewController)
}

class DayViewController: WeatherViewController {

    // MARK: - Properties

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!

    // MARK: -

    weak var delegate: DayViewControllerDelegate?

    // MARK: -

    var viewModel: DayViewViewModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Public Interface

    override func reloadData() {
        updateView()
    }

    // MARK: - View Methods

    private func updateView() {
        activityIndicatorView.stopAnimating()

        if let viewModel = viewModel {
            updateWeatherDataContainerView(withViewModel: viewModel)

        } else {
            messageLabel.isHidden = false
            messageLabel.text = "Cloudy was unable to fetch weather data."
        }
    }

    // MARK: -

    private func updateWeatherDataContainerView(withViewModel viewModel: DayViewViewModel) {
        weatherDataContainerView.isHidden = false
        dateLabel.text = viewModel.date
        timeLabel.text = viewModel.time
        iconImageView.image = viewModel.image
        windSpeedLabel.text = viewModel.windSpeed
        descriptionLabel.text = viewModel.summary
        temperatureLabel.text = viewModel.temperature
        
    }

    // MARK: - Actions

    @IBAction func didTapSettingsButton(sender: UIButton) {
        delegate?.controllerDidTapSettingsButton(controller: self)
    }

    @IBAction func didTapLocationButton(sender: UIButton) {
        delegate?.controllerDidTapLocationButton(controller: self)
    }

}
