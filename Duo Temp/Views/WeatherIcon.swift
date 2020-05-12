//
//  WeatherIcon.swift
//  Duo Temp
//
//  Created by Erik Kuipers on 5/12/20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI



struct WeatherIcon: View {
    
    @ObservedObject var forecastViewModel: ForecastViewModel
    
    var body: some View {

        Image(systemName: Helper().showWeatherIcon(item: self.forecastViewModel.weatherForecast))
            .resizable()
            .frame(width: 200, height: 150, alignment: .center)
            .foregroundColor(.white)
            .shadow(radius: 10)
    }
}

