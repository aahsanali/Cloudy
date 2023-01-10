//
//  SettingsViewUnitViewModelTests.swift
//  CloudyTests
//
//  Created by Naveed A. on 02.01.23.
//  Copyright © 2023 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

final class SettingsViewUnitViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testText_Imperical(){
        
        let model = SettingsViewUnitViewModel(unitNotation: .imperial)
        XCTAssertEqual(model.text, "Imperial")
    }
    func testText_Metric(){
        let model = SettingsViewUnitViewModel(unitNotation: .metric)
        XCTAssertEqual(model.text, "Metric")
    }
    
    func testCellAcccessoryType_Imperial_Check(){
        
        UserDefaults.standard.set(UnitsNotation.imperial.rawValue, forKey: UserDefaults.Keys.unitsNotation)
        let model = SettingsViewUnitViewModel(unitNotation: .imperial)
        XCTAssertEqual(model.cellAcccessoryType, UITableViewCell.AccessoryType.checkmark)
        
    }
    
    func testCellAcccessoryType_Imperial_None(){

        UserDefaults.standard.set(UnitsNotation.imperial.rawValue, forKey: UserDefaults.Keys.unitsNotation)
        let model = SettingsViewUnitViewModel(unitNotation: .metric)
        XCTAssertEqual(model.cellAcccessoryType, UITableViewCell.AccessoryType.none)

    }
    func testCellAcccessoryType_Metric_Check(){
        
        UserDefaults.standard.set(UnitsNotation.metric.rawValue, forKey: UserDefaults.Keys.unitsNotation)
        let model = SettingsViewUnitViewModel(unitNotation: .metric)
        XCTAssertEqual(model.cellAcccessoryType, UITableViewCell.AccessoryType.checkmark)
        
    }
    
    func testCellAcccessoryType_Metric_None(){

        UserDefaults.standard.set(UnitsNotation.metric.rawValue, forKey: UserDefaults.Keys.unitsNotation)
        let model = SettingsViewUnitViewModel(unitNotation: .imperial)
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
