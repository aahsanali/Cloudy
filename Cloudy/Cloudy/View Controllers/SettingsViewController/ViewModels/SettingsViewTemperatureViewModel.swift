//
//  SettingsViewTemperatureViewModel.swift
//  Cloudy
//
//  Created by Naveed A. on 30.12.22.
//  Copyright © 2022 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewTemperatureViewModel{
    
    let temperatureNotation:TemperatureNotation
    
    var text: String {
        
        switch temperatureNotation {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        }
        
    }
    
    var cellAcccessoryType: UITableViewCell.AccessoryType {
        
        if UserDefaults.temperatureNotation == temperatureNotation{
            return .checkmark
        }else{
            return .none
        }
        
    }
    
}

extension SettingsViewTemperatureViewModel: SettingsRepresentable{
    
}
