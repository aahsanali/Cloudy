//
//  SettingsViewTimeViewModel.swift
//  Cloudy
//
//  Created by Naveed A. on 30.12.22.
//  Copyright © 2022 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewTimeViewModel{
    
    let timeNotation: TimeNotation
    
    var text: String {
        
        switch timeNotation{
        case .twelveHour: return "12 Hour"
        case .twentyFourHour: return "24 Hour"
        }
    }
    
    var cellAcccessoryType: UITableViewCell.AccessoryType {
        
        if UserDefaults.timeNotation == timeNotation{
            return .checkmark
        }else{
            return .none
        }
    }
}
extension SettingsViewTimeViewModel: SettingsRepresentable{
    
}
