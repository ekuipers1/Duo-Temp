//
//  NewTopView.swift
//  Duo Temp
//
//  Created by Erik Kuipers on 4/28/20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct NewTopView: View {
    
    @Binding var showCityListView: Bool
    
//    @Environment(\.managedObjectContext) var managedObjectContext
//
//    //THIS SORTS BY DATE
//    @FetchRequest(entity: Duo_Temp.entity(), sortDescriptors: [
//        NSSortDescriptor(keyPath: \Duo_Temp.dateCreated, ascending: false)])
//
//    var fetchedItems: FetchedResults<Duo_Temp>
    @State private var MyLocation = ""
    @State private var bla = ""
    
    
    //    @Binding var cityAdded: String
    @State var placeHolder = "Enter city"
    @ObservedObject var forecastViewModel: ForecastViewModel
    @State var showField: Bool = false
    @ObservedObject var locationManager = LocationManager()
    
    var MyCurrentCity : String {
        
        return("\(locationManager.placemark?.locality ?? "XXX")")
        
    }
    
    var currentCity: String {
        
        if let city = self.locationManager.placemark?.locality { // self.weatherForecast.city?.name {
            print(city)
            return city
            
        }else {
            return ""
        }
    }
    
    var body: some View {
        
        HStack {

                Button(action: {
                    self.showCityListView.toggle()
                }) {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 24, weight: .regular))
                }
                .accentColor(Color.primary)
                .sheet(isPresented: $showCityListView) {
                    CityListView()
                }
                
                Spacer()
                
                TextField("Enter", text: self.$forecastViewModel.cityName) {
                    self.forecastViewModel.searchCity()
                    
                }.padding(.all, 10)
                    .frame(height: 50)
                    .background(Color("buttonShadow"))
                    .cornerRadius(30)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "gear")
                        .font(.system(size: 24, weight: .regular))
                }
                .accentColor(Color.primary)
            }
            .padding()
    }
        private func fetch() {
            self.forecastViewModel.searchCity()
        }
}

struct NewTopView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
