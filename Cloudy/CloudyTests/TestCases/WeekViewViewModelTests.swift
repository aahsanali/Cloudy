//
//  WeekViewViewModelTests.swift
//  CloudyTests
//
//  Created by Naveed A. on 05.01.23.
//  Copyright © 2023 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy
 
final class WeekViewViewModelTests: XCTestCase {

    var viewModel: WeekViewViewModel!
    
    override func setUpWithError() throws {
        
        let data = loadStubFromBundle(withName: "darksky", extension: "json")
        let weatherData = try! JSONDecoder().decode(WeatherData.self, from: data)
        viewModel = WeekViewViewModel(weatherData: weatherData.dailyData)

    }

    override func tearDownWithError() throws {

    }
    
    func testNumberOfSections(){
        XCTAssertEqual(viewModel.numOfSection, 1)
    }
    
    func testNumberOfDays(){
        XCTAssertEqual(viewModel.numberOfDays, 8)
    }

    func testViewModelForIndex(){
        
        let weatherDayViewViewModle = viewModel.viewModel(for: 5)
        XCTAssertEqual(weatherDayViewViewModle.day, "Thursday")
        XCTAssertEqual(weatherDayViewViewModle.date, "January 8")
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
