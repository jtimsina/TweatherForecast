//
//  LoadingView.swift
//  WeatherForecast
//
//  Created by Jai Timsina on 10/28/23.
//

import SwiftUI

struct LoadingOverlay: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

