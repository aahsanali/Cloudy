//
//  UnitsNotation.swift
//  Cloudy
//
//  Created by Bart Jacobs on 15/05/2020.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

enum UnitsNotation: Int {
    
    // MARK: - Cases
    
    case imperial
    case metric
    
    func speedString(windSpeed: Double) -> String{
        
        switch self{
        case .imperial:
            return String(format: "%.f MPH", windSpeed)
        case .metric:
            return String(format: "%.f KPH", windSpeed.toKPH)
        }
    }
}
