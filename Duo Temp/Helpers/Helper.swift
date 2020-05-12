//
//  Helper.swift
//  Duo Temp
//
//  Created by Erik Kuipers on 4/23/20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

import Foundation


struct Helper {
    
    func timeConverter(timeStamp: Int, isDay: Bool) -> String {
                 
                 let unixTimestamp = timeStamp // so we can get milliseconds!
                 
              let date = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
                 
                 let dateFormatter = DateFormatter()
                 dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
                 
                 dateFormatter.locale = NSLocale.current
                 dateFormatter.dateFormat = isDay ? "EEEE" : "EEEE, MMM d, yyyy"
                 
                 return dateFormatter.string(from: date)
                 
                 
             }
          
    func calculateFahrenheit(celsius: Double) -> Double {
        var fahrenheit: Double
        
        fahrenheit = celsius * 9 / 5 + 32
        
        return fahrenheit
    }
    
    

//       func showWeatherIcon(item: Weather) -> String {
//
//                   let main = item.main
//
//                   switch main {
//                   case "Ash":
//                       return "cloud.hail"
//                   case "Clear":
//                       return "sun.max"
//                   case "Clouds":
//                       return "cloud.sun.fill"
//                   case "Drizzle":
//                       return "cloud.drizzle.fill"
//                   case "Dust":
//                       return "sun.dust.fill"
//                   case "Fog":
//                       return "cloud.fog.fill"
//                   case "Haze":
//                       return "sun.haze.fill"
//                   case "Mist":
//                       return "cloud.drizzle"
//                   case "Rain":
//                       return "cloud.rain.fill"
//                   case "Sand":
//                       return "cloud.hail"
//                   case "Snow":
//                       return "cloud.snow.fill"
//                   case "Squall":
//                       return "cloud.hail"
//                   case "Thunderstorm":
//                       return "cloud.bol.fill"
//
//                   default:
//                       return "clear"
//                   }
//
//               }

       func showWeatherIcon(item: ForecastWeatherResponse) -> String {
        let main = item.list?.first?.weather![0].main

        //let main = (item.list?.first?.weather?.first?.main)!

               switch main {
               case "Ash":
                   return "cloud.hail"
               case "Clear":
                   return "sun.max"
               case "Clouds":
                   return "cloud.sun.fill"
               case "Drizzle":
                   return "cloud.drizzle.fill"
               case "Dust":
                   return "sun.dust.fill"
               case "Fog":
                   return "cloud.fog.fill"
               case "Haze":
                   return "sun.haze.fill"
               case "Mist":
                   return "cloud.drizzle"
               case "Rain":
                   return "cloud.rain.fill"
               case "Sand":
                   return "cloud.hail"
               case "Snow":
                   return "cloud.snow.fill"
               case "Squall":
                   return "cloud.hail"
               case "Thunderstorm":
                   return "cloud.bol.fill"

               default:
                   return "clear"
               }

           }
    
    
    func showWeatherIcon(item: MainForecastParams) -> String {
           //let main = item.list?.first?.weather![0].main
           let main = item.weather![0].main

           //let main = (item.list?.first?.weather?.first?.main)!

                  switch main {
                  case "Ash":
                      return "cloud.hail"
                  case "Clear":
                      return "sun.max"
                  case "Clouds":
                      return "cloud.sun.fill"
                  case "Drizzle":
                      return "cloud.drizzle.fill"
                  case "Dust":
                      return "sun.dust.fill"
                  case "Fog":
                      return "cloud.fog.fill"
                  case "Haze":
                      return "sun.haze.fill"
                  case "Mist":
                      return "cloud.drizzle"
                  case "Rain":
                      return "cloud.rain.fill"
                  case "Sand":
                      return "cloud.hail"
                  case "Snow":
                      return "cloud.snow.fill"
                  case "Squall":
                      return "cloud.hail"
                  case "Thunderstorm":
                      return "cloud.bol.fill"

                  default:
                      return "clear"
                  }

              }







}

   


