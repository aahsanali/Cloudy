//
//  DayViewViewModel.swift
//  Cloudy
//
//  Created by Naveed A. on 29.12.22.
//  Copyright © 2022 Cocoacasts. All rights reserved.
//

import UIKit

struct DayViewViewModel{
    // MARK: - Properties
    let weatherData: WeatherData
    private let dateformatter = DateFormatter()
    private let timeformatter = DateFormatter()

    var date:String{
        dateformatter.dateFormat = "EEE, MMMM d"
        return dateformatter.string(from: weatherData.time)
    }
    
    var time: String{
        timeformatter.dateFormat = UserDefaults.timeNotation.timeFormat
        return timeformatter.string(from: weatherData.time)
    }
    
    var summary: String{
        return weatherData.summary
    }
    
    var temperature: String{
        return UserDefaults.temperatureNotation.temperatureString(temperature: weatherData.temperature)
    }
        
    var windSpeed: String{
        
        let windSpeed = weatherData.windSpeed
        return UserDefaults.unitsNotation.speedString(windSpeed: windSpeed)
    }
    
    var image: UIImage?{
        return UIImage.imageForIcon(withName: weatherData.icon)
    }
    
    
}
