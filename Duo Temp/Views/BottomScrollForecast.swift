//
//  BottomScrollForecast.swift
//  Weather-Forecast-Test-XC11
//
//  Created by Paulo Dichone on 10/7/19.
//  Copyright © 2019 Paulo Dichone. All rights reserved.
//

import SwiftUI

struct BottomScrollForecast: View {
   
    let forecastData: MainForecastParams
    @State var icon = "sun.max"
    
    var temperatureF: String {
        if let temp = self.forecastData.temp?.min {
            var fahrenheit: Double
            fahrenheit = temp * 9 / 5 + 32
            let formattedString = String(format: "%.0f", fahrenheit)
            return formattedString + "°F"
        }else {
            return ""
        }
    }
    
    var temperatureFMax: String {
        if let temp = self.forecastData.temp?.max {
            var fahrenheit: Double
            fahrenheit = temp * 9 / 5 + 32
            let formattedString = String(format: "%.0f", fahrenheit)
            return formattedString + "°F"
        }else {
            return ""
        }
    }
    
    var windSpeedMPH: String {
        if let wind = self.forecastData.speed {
            var milesph: Double
            milesph = wind * (2.237)
            let formattedWindSpeed = String(format: "%.1f",(milesph))
            return formattedWindSpeed + " mi/h"
        }else {
            return ""
        }
    }
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                Text(String(Helper().timeConverter(timeStamp: forecastData.dt!, isDay: true)))
                    .foregroundColor(Color("icons"))

            }.offset(y: -75)
            
            HStack {
                Image(systemName: Helper().showWeatherIcon(item: forecastData))
                    .resizable()
                    .frame(width: 80, height: 60)
                    .foregroundColor(Color("secondary"))
                    .background(RoundedRectangle(cornerRadius:12)
                        .frame(width: 90, height: 120)
//                        .border(Color.white, width: 1)
                        .foregroundColor(Color("gradient2")))
                    .padding(.all, 15)
                    .offset(x: 5)
                    .shadow(radius: 10)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Image(systemName: "arrow.down")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                        Text(String(format: "%.0f", (forecastData.temp?.min)!) + "ºC")
                            .foregroundColor(.gray)
                        Text(temperatureF)
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Image(systemName: "arrow.up")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                        Text(String(format: "%.0f", (forecastData.temp?.max!)!) + "ºC")
                            .foregroundColor(.gray)
                        Text(temperatureFMax)
                            .foregroundColor(.gray)

                    }
                    
                    Text("Hum: \(String(forecastData.humidity!))" +
                    "%")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    Text("Win: \(String(format: "%.1f",forecastData.speed!)) m/s")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    Text("Win: \(windSpeedMPH)")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Spacer()
                
            }
            
            
            
        }.frame(width: 240, height: 200)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.leading, 15)
    }
}




struct BottomScrollForecast_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
