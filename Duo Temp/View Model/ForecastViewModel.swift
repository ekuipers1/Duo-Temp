//
//  ForecastViewModel.swift
//  Weather-Forecast-Final-XC11
//
//  Created by Paulo Dichone on 10/18/19.
//  Copyright © 2019 Paulo Dichone. All rights reserved.
//

import Combine
import SwiftUI

class ForecastViewModel: ObservableObject {
    
    @Environment(\.managedObjectContext) var managedObjectContext
        
    //THIS SORTS BY DATE
    @FetchRequest(entity: Duo_Temp.entity(), sortDescriptors: [
    NSSortDescriptor(keyPath: \Duo_Temp.dateCreated, ascending: false)])
    
    var fetchedItems: FetchedResults<Duo_Temp>
    
    
    
    var weatherService: Services!
    
    var cityName: String = "Portland"
    var lat: String = "49"
    var lon: String = "11"
    private var locationManger = LocationManager()
    @ObservedObject var locationManager = LocationManager()
    
    @Published var weatherForecast = ForecastWeatherResponse()
    
    var MyCurrentCity: String {
        return("\(locationManager.placemark?.locality ?? "NA")")
    }
    
    init() {
        self.weatherService = Services()
    }

    var currentCity: String  {
        if let city = self.weatherForecast.city?.name {
            return city
        }else {
            return ""
        }
    }
    
    var currentCountry: String {
        if let country = self.weatherForecast.city?.country {
            return country
        }else {
            return ""
        }
    }
    
    
    
    func getForecastList() -> [MainForecastParams] {
        if let mList = self.weatherForecast.list {
            // print("List \(mList)")
            return mList
        }else {
            return []
        }
    }
    
    
    var weatherDescription: String {
        if let description = self.weatherForecast.list?.first?.weather?.first?.description {
            let formattedDesc = description.capitalized(with: .current)
            
            return formattedDesc
        }else {
            return ""
        }
    }
    var temperature: String {
        if let temp = self.weatherForecast.list?.first?.temp?.day {
            let formattedString = String(format: "%.0f", temp)
            return formattedString + "°C"
        }else {
            return ""
        }
    }
    
    var temperatureF: String {
        if let temp = self.weatherForecast.list?.first?.temp?.day {
            var fahrenheit: Double
            fahrenheit = temp * 9 / 5 + 32
            let formattedString = String(format: "%.0f", fahrenheit)
            return formattedString + "°F"
        }else {
            return ""
        }
    }
    
    
    
    
    var weatherDay: String {
        if let day = self.weatherForecast.list?.first?.dt {
            let formattedDay = Helper().timeConverter(timeStamp: day, isDay: false)
            return formattedDay
        }else {
            return ""
        }
    }
    
    
    var windSpeed: String {
        if let wind = self.weatherForecast.list?.first?.speed {
            let formattedWindSpeed = String(format: "%.1f",(wind))
            return formattedWindSpeed + " m/s"
        }else {
            return ""
        }
    }
    
    var windSpeedMPH: String {
        if let wind = self.weatherForecast.list?.first?.speed {
            var milesph: Double
            milesph = wind * (2.237)
            let formattedWindSpeed = String(format: "%.1f",(milesph))
            return formattedWindSpeed + " mi/h"
        }else {
            return ""
        }
    }
    
    var humidity: String {
        if let hum = self.weatherForecast.list?.first?.humidity {
            let formattedHum = String(hum)
            return formattedHum + "%"
        }else {
            return ""
        }
    }
    
    var maxTemp: String {
        if let max = self.weatherForecast.list?.first?.temp?.max {
            let formattedMaxTemp = String(format: "%.0f",(max))
            return formattedMaxTemp + "°"
        }else {
            return ""
        }
    }
    
    var maxTempF: String {
        if let max = self.weatherForecast.list?.first?.temp?.max {
            var fahrenheit: Double
            fahrenheit = max * 9 / 5 + 32
            let formattedString = String(format: "%.0f", fahrenheit)
            return formattedString + "°F"
        }else {
            return ""
        }
    }
    
    
    //    var locationCity: String {
    //
    ////        print(#function, cityName)
    //    }
    
    
    
    func searchCity() {
        if let city = self.MyCurrentCity.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeatherForecast(by: city)
        }
    }
    
    
    //    func fetchWeatherForecast(by lat: String, lon: String) {
    //        self.weatherService.getWeatherData(lat: lat, lon: lon) {
    //                 forecast in
    //                if let forecast = forecast {
    //                    DispatchQueue.main.async {
    //                        self.weatherForecast = forecast
    //
    //    //                    print("Forecast: \(forecast)")
    //                    }
    //                }
    //            }
    //        }
    

    func fetchWeatherForecast(by city: String) {
        self.weatherService.getWeatherData(city: cityName) {
            forecast in
            if let forecast = forecast {
                DispatchQueue.main.async {
                    self.weatherForecast = forecast
                    
                    //                    print("Forecast: \(forecast)")
                }
            }
        }
    }
    
}


