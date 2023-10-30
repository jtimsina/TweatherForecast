//
//  Extention.swift
//  WeatherForecast
//
//  Created by Jai Timsina on 10/30/23.
//

import Foundation
class ReloadViewHelper: ObservableObject {
    func reloadView() {
        objectWillChange.send()
    }
}
