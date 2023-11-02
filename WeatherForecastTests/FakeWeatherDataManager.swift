//
//  FakeWeatherDataManager.swift
//  WeatherForecastTests
//
//  Created by Jai Timsina on 11/2/23.
//

import Foundation
@testable import WeatherForecast
import CoreLocation

class FakeWeatherDataManager: WeatherContract {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherForecast.ResponseBody {
        return WeatherForecast.ResponseBody(coord: ResponseBody.CoordinatesResponse(lon:100.0, lat: 20.0), weather: [], main: ResponseBody.MainResponse(temp: 100.0, feels_like: 100.0, temp_min: 100.0, temp_max: 100.0, pressure: 100.0, humidity: 100.0), name: "", wind: ResponseBody.WindResponse(speed:100, deg: 10))
    }
}
