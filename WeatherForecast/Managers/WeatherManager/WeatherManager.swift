//
//  WeatherManager.swift
//  WeatherForecast
//
//  Created by Jai Timsina on 10/28/23.
//

import Foundation
import CoreLocation
import Combine

enum WeatherError: Error {
    case networkError
}

class WeatherManager {

    @Published var weather: ResponseBody?
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees)async throws -> ResponseBody {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=649fe37acdaea1dd87e01364f3da15d1&units=metric") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw WeatherError.networkError
        }
        
        return  try JSONDecoder().decode(ResponseBody.self, from: data)
    }
}

