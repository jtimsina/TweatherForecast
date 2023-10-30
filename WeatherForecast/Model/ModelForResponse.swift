//
//  ModelForResponse.swift
//  WeatherForecast
//
//  Created by Jai Timsina on 10/28/23.
//

import Foundation
import UIKit

struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}

struct CurrentWeatherInfo {
    let tempMax: Int
    let tempMin: Int
    let temp: Int
    let cityName: String
    let description: String
    let icon: String
    let iconImage: UIImage?
    
    init(cityName: String, temp: Int, tempMin: Int, tempMax: Int, description: String, icon: String, iconImage: UIImage? = nil) {
        self.cityName = cityName
        self.temp = temp
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.description = description
        self.icon = icon
        self.iconImage = iconImage
    }
    
    init(weatherData: ResponseBody?, iconImage: UIImage? = nil) {
        let weather = weatherData?.weather[0]
        let main = weatherData?.main
        self.tempMax = Int(main?.tempMax ?? 99)
        self.tempMin = Int(main?.tempMin ?? 44)
        self.temp = Int(main?.temp ?? 66)
        self.cityName = weatherData?.name.capitalized ?? "London"
        self.description = weather?.description.localizedCapitalized ?? "Windy"
        self.icon = weather?.icon ?? "01n"
        self.iconImage = iconImage
    }
}
