//
//  WeatherForecastTests.swift
//  WeatherForecastTests
//
//  Created by Jai Timsina on 10/27/23.
//

import XCTest
@testable import WeatherForecast

final class WeatherForecastTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor func testExample() async throws {

        //Given
        let weather = WeatherManager()
        
        //when
        let currentWeatherInformation: () = try await weather.getCurrentWeather(latitude: 33.33, longitude: 55.55)
        //then
        XCTAssertNotNil(weather)
        XCTAssertNotNil(currentWeatherInformation)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
