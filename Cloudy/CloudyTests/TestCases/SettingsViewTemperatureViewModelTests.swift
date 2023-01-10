//
//  SettingsViewTemperatureViewModelTests.swift
//  CloudyTests
//
//  Created by Naveed A. on 02.01.23.
//  Copyright © 2023 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

final class SettingsViewTemperatureViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testText_Imperical(){
        
        let model = SettingsViewTemperatureViewModel(temperatureNotation: .celsius)
        XCTAssertEqual(model.text, "Celsius")
    }
    func testText_Metric(){
        let model = SettingsViewTemperatureViewModel(temperatureNotation: .fahrenheit)
        XCTAssertEqual(model.text, "Fahrenheit")
    }
    
    func testCellAcccessoryType_Celsius_Check(){
        
        UserDefaults.standard.set(TemperatureNotation.celsius.rawValue, forKey: UserDefaults.Keys.temperatureNotation)
        let model = SettingsViewTemperatureViewModel(temperatureNotation: .celsius)
        XCTAssertEqual(model.cellAcccessoryType, UITableViewCell.AccessoryType.checkmark)
        
    }
    
    func testCellAcccessoryType_Celsius_None(){

        UserDefaults.standard.set(TemperatureNotation.celsius.rawValue, forKey: UserDefaults.Keys.unitsNotation)
        let model = SettingsViewTemperatureViewModel(temperatureNotation: .fahrenheit)
        XCTAssertEqual(model.cellAcccessoryType, UITableViewCell.AccessoryType.none)

    }
    func testCellAcccessoryType_Fahrenheit_Check(){
        
        UserDefaults.standard.set(TemperatureNotation.fahrenheit.rawValue, forKey: UserDefaults.Keys.temperatureNotation)
        let model = SettingsViewTemperatureViewModel(temperatureNotation: .fahrenheit)
        XCTAssertEqual(model.cellAcccessoryType, UITableViewCell.AccessoryType.checkmark)
        
    }
    
    func testCellAcccessoryType_Fahrenheit_None(){

        UserDefaults.standard.set(TemperatureNotation.fahrenheit.rawValue, forKey: UserDefaults.Keys.unitsNotation)
        let model = SettingsViewTemperatureViewModel(temperatureNotation: .celsius)
        XCTAssertEqual(model.cellAcccessoryType, UITableViewCell.AccessoryType.none)

    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
