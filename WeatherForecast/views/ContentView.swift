//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Jai Timsina on 10/27/23.
//

import SwiftUI

struct ContentView: View {
    // Replace YOUR_API_KEY in WeatherManager with your own API key for the app to work
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
                    if self.isActive {
                        if let location = locationManager.location {
                            if let weather = weather {
                                WeatherView(weather: weather)
                            } else {
                                LoadingOverlay()
                                    .task {
                                        do {
                                            weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                        } catch {
                                            //DO NOTHING
                                            print(error) //remove print statement
                                        }
                                    }
                            }
                        } else if locationManager.isLoading {
                            LoadingOverlay()
                        } else {
                            WelcomeView().environmentObject(locationManager)
                        }
                    } else {
                        Rectangle()
                            .background(Color.white)
                        Image("toyotaLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation {
                            self.isActive = true
                            
                        }
                    }
                }
                .background(Color.clear)
                .preferredColorScheme(.dark)
                .refreshable {
                    print("Do your refresh work here")
                }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
