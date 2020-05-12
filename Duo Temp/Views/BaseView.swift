//
//  BaseView.swift
//  Duo Temp
//
//  Created by Erik Kuipers on 4/29/20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct BaseView: View {
    
    @State var showView: Bool = false
    private var locationManger = LocationManager()
    @ObservedObject var forcastViewModel:
    ForecastViewModel
    
//    ObservedObject private var locationManager  = LocationManager()
    
    @ObservedObject var locationManager = LocationManager()

    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    var mylocation: String {
        return "\(locationManager.lastLocation?.description ?? "")"
    }
    
    
    init () {
        self.forcastViewModel = ForecastViewModel()
    }
    

    
    
    
        var body: some View {
            
            ZStack {
               
                BackSplash()
            
            
            
            VStack {
                
            // MARK: - HEADER
    //        NewTopView()
    //        BackSplash()
    //         Spacer()
            
            
            
            ZStack {
               
    //            BackSplash()
                


                VStack {
                    
                    
                    
//                    let coordinate = self.locationManager.location != nil ?
                        
//                        self.locationManager.location!.coordinate: loc
//                        self.locationManager.location!.coordinate : CLLocationCoordinate2D()
//                    return ZStack{
//                        MapView()
//                        LocationManager.convertLatLongToAddress(latitude: userLatitude, longitude: userLongitude)
                    

//                    locationManager.convertLatLongToAddress(latitude: userLatitude, longitude: userLongitude)
                    
//                    Text("City name: \(locationManager.)")
                    
                    Text("location status: \(locationManager.statusString)")
                    HStack {
                        Text("latitude: \(userLatitude)")
                        Text("longitude: \(mylocation)")
                    }
                    

                    
                                
//
//                    TopView(showField: self.showView, forecastViewModel: self.forcastViewModel)
                    
                    CityInfo(forecastViewModel: self.forcastViewModel)
                    

                    
                    
                }
                
                VStack(alignment: .center, spacing: 8) {
                    
                    Image(systemName: Helper().showWeatherIcon(item: self.forcastViewModel.weatherForecast))
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .foregroundColor(.white)
                    
                    CurrentTempView(forecastViewModel: self.forcastViewModel)
                }
            
            }
            
            
            //        ZStack {
            //            BackSplash()
            //
            //            TextField("Enter City name", text: self.$forcastViewModel.cityName) {
            //                self.forcastViewModel
            //                    .searchCity()
            //            }
            //            VStack {
            //                Text("City \(self.forcastViewModel.cityName)")
            //                Text("Country \(self.forcastViewModel.currentCountry)")
                        }
                    }
        }
    }

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
