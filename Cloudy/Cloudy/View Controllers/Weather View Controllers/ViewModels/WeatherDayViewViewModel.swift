//
//  WeatherDayViewViewModel.swift
//  Cloudy
//
//  Created by Naveed A. on 30.12.22.
//  Copyright © 2022 Cocoacasts. All rights reserved.
//

import UIKit


struct WeatherDayViewViewModel{
    
    let weatherDayData: WeatherDayData
    
    private let dayFormatter = DateFormatter()
    private let dateFormatter = DateFormatter()
    
    var day: String{
        
        dayFormatter.dateFormat = "EEEE"
        return dayFormatter.string(from: weatherDayData.time)
    }
    
    var date: String{
        
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: weatherDayData.time)

    }
    
    var temperature: String {
        
        let min = UserDefaults.temperatureNotation.temperatureString(temperature: weatherDayData.temperatureMin)
        let max = UserDefaults.temperatureNotation.temperatureString(temperature: weatherDayData.temperatureMax)
        return "\(min) - \(max)"

    }
    
    var windSpeed: String{
        
        return UserDefaults.unitsNotation.speedString(windSpeed: weatherDayData.windSpeed)

    }
    
    var image:UIImage?{
        
        return UIImage.imageForIcon(withName: weatherDayData.icon)
    }
}

extension WeatherDayViewViewModel: WeatherDayRepresentable{
    
}
