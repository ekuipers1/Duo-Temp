//
//  ContentView.swift
//  Duo Temp
//
//  Created by Erik Kuipers on 5/11/20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
        
    //THIS SORTS BY DATE
    @FetchRequest(entity: Duo_Temp.entity(), sortDescriptors: [
    NSSortDescriptor(keyPath: \Duo_Temp.dateCreated, ascending: false)])
    
    var fetchedItems: FetchedResults<Duo_Temp>
    @State private var toDoItem = ""
    @State var showView: Bool = false
    @ObservedObject var forcastViewModel:
    ForecastViewModel
    private var locationManger = LocationManager()
    @ObservedObject var locationManager = LocationManager()
    
    @State private var bla = String()
//    var item:String = ""
    var CurrentCity: String = ""
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    var MyCurrentCity: String {
        get {
        
//        bla = ("\(locationManager.placemark?.locality ?? "NA")")
//        return(bla)
        return("\(locationManager.placemark?.locality ?? "NA")")
    }
        set {
            bla = ("\(locationManager.placemark?.locality ?? "NA")")
        }
    }
    
//    @State var status: String    { return("\(String(describing: locationManager.placemark))") }
    
    init () {
        self.forcastViewModel = ForecastViewModel()
    }
    
    var body: some View {
        
     GeometryReader { gr in
        BackSplash()
     ScrollView(.vertical, showsIndicators: false) {
        ZStack {
            
            
            
//            ZStack {
               
                VStack {

                    HStack {
                        
                        
                        Text(self.CurrentCity)
                            .font(.headline)

                        
                        }

                    NewTopView(showCityListView:self.$showView, forecastViewModel:self.forcastViewModel)
                    
//                    NewTopView(forecastViewModel:self.forcastViewModel)
                    
                    CityInfo(forecastViewModel: self.forcastViewModel)
                    
                    
                    
                    WeatherIcon(forecastViewModel: self.forcastViewModel)
//                }
                
                VStack(alignment: .center, spacing: 8) {
                    
                    CurrentTempView(forecastViewModel: self.forcastViewModel)
                    Text("7-Day Weather Forecast")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.all, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.forcastViewModel.getForecastList(), id: \.dt) { forecast in
                                BottomScrollForecast(forecastData: forecast)
                                
                            }
                        }
                    }
                }
            }
        }.onAppear(perform: self.fetch)
        }
        }
    }
    private func fetch() {
        forcastViewModel.searchCity()
        //    self.forecastViewModel.searchCity()
    }
    
}
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        Text("Hello, World!")
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
