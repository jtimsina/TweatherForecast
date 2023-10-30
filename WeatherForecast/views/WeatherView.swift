//
//  WeatherView.swift
//  WeatherForecast
//
//  Created by Jai Timsina on 10/28/23.
//

import SwiftUI

struct WeatherView: View {
  
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud.sun.rain.fill")
                                .font(.system(size: 40))
                            
                        }
                        .frame(width: 130, alignment: .leading)
                      

                        Text("\(Int(weather.main.feelsLike * 1.8 + 32))" + "°")
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
                        WeatherRow(logo: "thermometer", name: "Todays Min", value: ("\(Int(weather.main.tempMin * 1.8 + 32))" + ("°")))
                        Spacer(minLength: 20)
                        WeatherRow(logo: "thermometer", name: "Todays Max", value: ("\(Int(weather.main.tempMax * 1.8 + 32))" + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: ("\(weather.wind.speed)" + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity)%")
                    }
                  
                    HStack {
                        if (weather.weather[0].description == "clear sky"){
                            Image("clearSky")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        } else {
                            Image("rainImage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        }
                    }
                    

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
}


