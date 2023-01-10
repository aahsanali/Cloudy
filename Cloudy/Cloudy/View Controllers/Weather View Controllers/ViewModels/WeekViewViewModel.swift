//
//  WeekViewViewModel.swift
//  Cloudy
//
//  Created by Naveed A. on 30.12.22.
//  Copyright © 2022 Cocoacasts. All rights reserved.
//

import UIKit

struct WeekViewViewModel{
    
    let weatherData: [WeatherDayData]
    private let dateFormatter = DateFormatter()
    private let dayFormatter = DateFormatter()

    
    var numOfSection: Int{
        
        return 1
    }
    
    var numberOfDays: Int{
        
        return weatherData.count
    }
    
    func viewModel(for index:Int) -> WeatherDayViewViewModel{
        
        return WeatherDayViewViewModel(weatherDayData: weatherData[index])
    }
    
    func day(for index:Int) -> String{
        
        let weatherDayData = weatherData[index]
        dayFormatter.dateFormat = "EEEE"
        return dayFormatter.string(from: weatherDayData.time)
        
    }
    func date(for index:Int) -> String {
        
        let weatherDayData = weatherData[index]
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: weatherDayData.time)
        
    }
    func temperature(for index:Int) -> String{

        let weatherDayData = weatherData[index]
        let min = UserDefaults.temperatureNotation.temperatureString(temperature: weatherDayData.temperatureMin)
        let max = UserDefaults.temperatureNotation.temperatureString(temperature: weatherDayData.temperatureMax)
        return "\(min) - \(max)"
        
    }
    
    func windSpeed(for index: Int) -> String{
        
        let weatherDayData = weatherData[index]
        return UserDefaults.unitsNotation.speedString(windSpeed: weatherDayData.windSpeed)
    }
    
    func image(for index:Int) -> UIImage?{
        
        let weatherDayData = weatherData[index]
        return UIImage.imageForIcon(withName: weatherDayData.icon)
        
    }
    
    
}
