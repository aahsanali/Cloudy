//
//  TemperatureNotation.swift
//  Cloudy
//
//  Created by Bart Jacobs on 15/05/2020.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

enum TemperatureNotation: Int {
    
    // MARK: - Cases
    
    case fahrenheit
    case celsius
    
    func temperatureString(temperature: Double) -> String{
        switch self {
        case .fahrenheit:
            return String(format: "%.1f 째F", temperature)
        case .celsius:
            return String(format: "%.1f 째C", temperature.toCelcius)
        }
    }
}
