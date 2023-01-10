//
//  SettingsViewTimeViewModelTests.swift
//  CloudyTests
//
//  Created by Naveed A. on 02.01.23.
//  Copyright © 2023 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

final class SettingsViewTimeViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        

    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        UserDefaults.standard.removeObject(forKey: UserDefaults.Keys.timeNotation)
    }

    // MARK: - Tests for Text
    
    func testText_TwelveHour(){
        let viewModel = SettingsViewTimeViewModel(timeNotation: .twelveHour)
        XCTAssertEqual(viewModel.text, "12 Hour")
    }
    func testText_TwentyFourHour(){
        let viewModel = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)
        XCTAssertEqual(viewModel.text, "24 Hour")
    }

    func testAccessoryType_TwelveHour_TwelveHour(){
        
        UserDefaults.standard.set(TimeNotation.twelveHour.rawValue, forKey: UserDefaults.Keys.timeNotation)
        let viewModel = SettingsViewTimeViewModel(timeNotation: .twelveHour)
        XCTAssertEqual(viewModel.cellAcccessoryType, UITableViewCell.AccessoryType.checkmark)
    }
    func testAccessoryType_TwelveHour_TwentyFourHour(){
        
        UserDefaults.standard.set(TimeNotation.twelveHour.rawValue, forKey: UserDefaults.Keys.timeNotation)
        let viewModel = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)
        XCTAssertEqual(viewModel.cellAcccessoryType, UITableViewCell.AccessoryType.none)
    }
    func testAccessoryType_TwentyFourHour_TwelveHour(){
        
        UserDefaults.standard.set(TimeNotation.twentyFourHour.rawValue, forKey: UserDefaults.Keys.timeNotation)
        let viewModel = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)
        XCTAssertEqual(viewModel.cellAcccessoryType, UITableViewCell.AccessoryType.checkmark)
    }
    func testAccessoryType_TwentyFourHour_TwentyFourHour(){
        
        UserDefaults.standard.set(TimeNotation.twentyFourHour.rawValue, forKey: UserDefaults.Keys.timeNotation)
        let viewModel = SettingsViewTimeViewModel(timeNotation: .twelveHour)
        XCTAssertEqual(viewModel.cellAcccessoryType, UITableViewCell.AccessoryType.none)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
