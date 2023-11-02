//
//  WeatherForecastTests.swift
//  WeatherForecastTests
//
//  Created by Jai Timsina on 10/27/23.
//

import XCTest
@testable import WeatherForecast
import CoreLocation

final class WeatherForecastTests: XCTestCase {
    
    private var weatherViewModel: WeatherViewModel!
    let fakeWeatherDataManager: WeatherContract = FakeWeatherDataManager()
    override func setUpWithError() throws {
        weatherViewModel = WeatherViewModel(weatherManager: fakeWeatherDataManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetWorkCallSuccess() async {
        await weatherViewModel.getWeather(for: CLLocationCoordinate2D(latitude: 10.0, longitude: 100.0))
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

}
