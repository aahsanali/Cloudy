//
//  DayViewViewModelTests.swift
//  CloudyTests
//
//  Created by Naveed A. on 03.01.23.
//  Copyright © 2023 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

final class DayViewViewModelTests: XCTestCase {

    var viewModel: DayViewViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let data = loadStubFromBundle(withName: "darksky", extension: "json")
        let weatherData = try! JSONDecoder().decode(WeatherData.self, from: data)
        viewModel = DayViewViewModel(weatherData: weatherData)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testDate(){
        XCTAssertEqual(viewModel.date, "Sat, January 3")
    }
    func testTime_TwelveHours(){
        
        UserDefaults.standard.set(TimeNotation.twelveHour.rawValue, forKey: UserDefaults.Keys.timeNotation)
        XCTAssertEqual(viewModel.time, "01:05 PM")
    }
    func testTime_TwentyFourHours(){
        
        UserDefaults.standard.set(TimeNotation.twentyFourHour.rawValue, forKey: UserDefaults.Keys.timeNotation)
        XCTAssertEqual(viewModel.time, "13:05")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTemperature_Fahrenhit(){
        
        UserDefaults.standard.set(TemperatureNotation.fahrenheit.rawValue, forKey: UserDefaults.Keys.temperatureNotation)
        
        XCTAssertEqual(viewModel.temperature, "44.5 째F")
        
    }
    func testTemperature_Celsius(){
        
        UserDefaults.standard.set(TemperatureNotation.celsius.rawValue, forKey: UserDefaults.Keys.temperatureNotation)
        
        XCTAssertEqual(viewModel.temperature, "7.0 째C")
        
    }
    
    func testWindSpeed_MPH(){
        
        UserDefaults.standard.set(UnitsNotation.imperial.rawValue, forKey: UserDefaults.Keys.unitsNotation)
        XCTAssertEqual(viewModel.windSpeed, "7 MPH")
        
    }
    func testWindSpeed_KPH(){
        
        UserDefaults.standard.set(UnitsNotation.metric.rawValue, forKey: UserDefaults.Keys.unitsNotation)
        XCTAssertEqual(viewModel.windSpeed, "11 KPH")
        
    }
}
