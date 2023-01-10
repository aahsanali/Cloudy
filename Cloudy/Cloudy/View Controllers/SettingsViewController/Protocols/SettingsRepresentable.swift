//
//  SettingsRepresentable.swift
//  Cloudy
//
//  Created by Naveed A. on 30.12.22.
//  Copyright © 2022 Cocoacasts. All rights reserved.
//

import UIKit


protocol SettingsRepresentable{
    
    var text: String {get}
    var cellAcccessoryType: UITableViewCell.AccessoryType {get}
    
}
