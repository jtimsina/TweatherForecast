//
//  WeatherForecastTests.swift
//  WeatherForecastTests
//
//  Created by Jai Timsina on 10/27/23.
//

import XCTest
@testable import WeatherForecast

final class WeatherForecastTests: XCTestCase {
    
    private var weatherViewModel: WeatherViewModel!
    
    override func setUpWithError() throws {
        weatherViewModel = WeatherViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetWorkCall() {
        XCTAssertNotNil(weatherViewModel.weatherData)
        XCTAssertNotNil(weatherViewModel.weatherData?.name)
        XCTAssertNotNil(weatherViewModel.weatherData?.main.tempMin)
        XCTAssertNotNil(weatherViewModel.weatherData?.main.tempMax)
        XCTAssertNotNil(weatherViewModel.weatherData?.main.humidity)
        XCTAssertNotNil(weatherViewModel.weatherData?.wind.speed)
        XCTAssertGreaterThan(Int(weatherViewModel.weatherData?.main.tempMax ?? 0), Int(weatherViewModel.weatherData?.main.tempMin ?? 0))
    }
    
    func testUiComments(){
        
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
