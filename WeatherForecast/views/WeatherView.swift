//
//  WeatherView.swift
//  WeatherForecast
//
//  Created by Jai Timsina on 10/28/23.
//

import SwiftUI

struct WeatherView: View {
  
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    @ObservedObject var reloadViewHelper = ReloadViewHelper()
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .leading) {
                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(weather?.name ?? "City")
                            .bold()
                            .font(.title)

                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    VStack {
                        HStack {
                            VStack(spacing: 20) {
                                Image(systemName: "cloud.sun.rain.fill")
                                    .font(.system(size: 40))
                                
                            }
                            .frame(width: 130, alignment: .leading)
                          

                            Text("\(Int((weather?.main.feelsLike ?? 1) * 1.8 + 32))" + "°")
                                .font(.system(size: 100))
                                .fontWeight(.bold)
                                .padding()
                            
                        }
                        
                        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                            .fontWeight(.light)
                        
                        Text("Current Weather")
                            .bold()
                            .padding(.bottom)
                        
                        HStack {
                            WeatherRow(logo: "thermometer", name: "Todays Min", value: ("\(Int((weather?.main.tempMin ?? 1) * 1.8 + 32))" + ("°")))
                            Spacer()
                            WeatherRow(logo: "wind", name: "Wind speed", value: ("\(( weather?.wind.speed) ?? 0)" + " m/s"))
                        }
                        
                        HStack {
                            WeatherRow(logo: "thermometer", name: "Todays Max", value: ("\(Int((weather?.main.tempMax ?? 1) * 1.8 + 32))" + "°"))
                            Spacer()
                            WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather?.main.humidity ?? 0)%")
                        }
                      
                        HStack {
                            if (weather?.weather[0].description == "clear sky"){
                                Image("clearSky")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                            } else {
                                Image("rainImage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                            }
                            
                        }
                        Spacer()
                        Text("The Free API contains only the current location, hence there is no way to show full 1 week forecast unless subscribed to paid API call that give current location Weather Forecast.")
                            .font(.system(size: 12))
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    

                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color.black)
            .preferredColorScheme(.light)
        }
        .refreshable {
            do {
                weather = try await weatherManager.getCurrentWeather(latitude: locationManager.location?.latitude ?? 39.90311, longitude: locationManager.location?.longitude ?? -76.83659)
                locationManager.requestLocation()
                reloadViewHelper.reloadView()
            } catch {
                //DO NOTHING
                print (String(describing: error))
            }
        }
    }
}
