//
//  CityInfo.swift
//  Duo Temp
//
//  Created by Erik Kuipers on 4/23/20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct CityInfo: View {
    @ObservedObject var forecastViewModel: ForecastViewModel
//
     var locationManger = LocationManager()
    @ObservedObject var locationManager = LocationManager()
    
    var MyCurrentCity: String {
        return("\(locationManager.placemark?.locality ?? "XXX")")
    }
    
    
    
    var body: some View {
        VStack {
            
            HStack {
                VStack {
//                Text("\(MyCurrentCity), \(self.forecastViewModel.currentCountry)")
                Text("\(self.forecastViewModel.currentCity), \(self.forecastViewModel.currentCountry)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.light)
                
                Text(self.forecastViewModel.weatherDay)
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .bold()
                    .padding(.leading)
            }
            }
            Spacer()
            .padding()
        }
//        .padding(.trailing, 190)
    }
}

struct CityInfo_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
