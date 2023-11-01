//
//  weatherViewModel.swift
//  WeatherForecast
//
//  Created by Jai Timsina on 11/1/23.
//

import Foundation
import CoreLocation
import Combine
class WeatherViewModel: ObservableObject {
    
    private let locationManager: LocationManager
    private let weatherManager: WeatherManager
    private var anyCancellable: AnyCancellable?
    
    @Published var weatherData: ResponseBody?
    
    init(locationManager: LocationManager = LocationManager(), weatherManager: WeatherManager = WeatherManager()) {
        self.locationManager = locationManager
        self.weatherManager = weatherManager
        getLocation()

    }
    
    
    @MainActor func getWeather(for location: CLLocationCoordinate2D) async  {
       
        do {
            weatherData =  try await weatherManager.getCurrentWeather(latitude: locationManager.location?.latitude ?? 39.90311, longitude: locationManager.location?.longitude ?? -76.83659)
        } catch {
            
        }
    }
    
    func getLocation() {
        anyCancellable = locationManager.$location.sink {  location in
            if let _loacation = location {
                Task {
                    await self.getWeather(for: _loacation)
                }
            }
        }
    }
    
}
