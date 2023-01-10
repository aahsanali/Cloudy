//
//  SettingsViewUnitViewModel.swift
//  Cloudy
//
//  Created by Naveed A. on 30.12.22.
//  Copyright © 2022 Cocoacasts. All rights reserved.
//

import UIKit


struct SettingsViewUnitViewModel{
    
    let unitNotation:UnitsNotation
    
    var text: String {
        
        switch unitNotation {
        case .imperial:
            return "Imperial"
        case .metric:
            return "Metric"
        }
        
    }
    
    var cellAcccessoryType: UITableViewCell.AccessoryType {
        
        if UserDefaults.unitsNotation == unitNotation{
            return .checkmark
        }else{
            return .none
        }
        
    }
}
extension SettingsViewUnitViewModel: SettingsRepresentable{
    
}
