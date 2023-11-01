//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Jai Timsina on 10/27/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var weatherViewModel = WeatherViewModel()
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
                    if self.isActive {
                   
                        if weatherViewModel.weatherData != nil {
                                WeatherView()
                            } else {
                                LoadingOverlay()
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
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
