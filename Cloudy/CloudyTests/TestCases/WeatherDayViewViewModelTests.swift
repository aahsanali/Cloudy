//
//  WeatherDayViewViewModelTests.swift
//  CloudyTests
//
//  Created by Naveed A. on 09.01.23.
//  Copyright © 2023 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

final class WeatherDayViewViewModelTests: XCTestCase {

    var viewModel: WeatherDayViewViewModel!
    
    override func setUpWithError() throws {

        let data = loadStubFromBundle(withName: "darksky", extension: "json")
        let weatherData = try! JSONDecoder().decode(WeatherData.self, from: data)
        viewModel = WeatherDayViewViewModel(weatherDayData: weatherData.dailyData[5])
        
    }

    override func tearDownWithError() throws {

        UserDefaults.standard.removeObject(forKey: UserDefaults.Keys.unitsNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaults.Keys.temperatureNotation)
    }

    func testDay(){
        XCTAssertEqual(viewModel.day, "Thursday")
    }
    func testDate(){
        XCTAssertEqual(viewModel.date, "January 8")
    }
    func testTemperature_Fahrenheit(){
        UserDefaults.standard.set(TemperatureNotation.fahrenheit.rawValue, forKey: UserDefaults.Keys.temperatureNotation)
        XCTAssertEqual(viewModel.temperature, "49.9 째F - 59.7 째F")
    }
    func testTemperature_Celsius(){
        UserDefaults.standard.set(TemperatureNotation.celsius.rawValue, forKey: UserDefaults.Keys.temperatureNotation)
        XCTAssertEqual(viewModel.temperature, "10.0 째C - 15.4 째C")
        
    }
    func testWindSpeed_Metric(){
        
        UserDefaults.standard.set(UnitsNotation.metric.rawValue, forKey: UserDefaults.Keys.unitsNotation)
        XCTAssertEqual(viewModel.windSpeed, "21 KPH")
    }
    
    func testWindSpeed_Imperial(){
        UserDefaults.standard.set(UnitsNotation.imperial.rawValue, forKey: UserDefaults.Keys
            .unitsNotation)
        XCTAssertEqual(viewModel.windSpeed, "13 MPH")
    }
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
