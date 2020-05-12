//
//  TopView.swift
//  Duo Temp
//
//  Created by Erik Kuipers on 4/23/20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

let UIWidth = UIScreen.main.bounds.width
let UIHeight = UIScreen.main.bounds.height

struct TopView: View {
    @State var showField: Bool = false
    @ObservedObject var forecastViewModel: ForecastViewModel
    @State var username: String = ""
    var body: some View {
        ZStack {
            ZStack(alignment: .center) {
                
                Spacer()
                VStack(alignment: .center) {
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "list.bullet")
                            .font(.system(size: 24, weight: .regular))
                    }
                    .accentColor(Color.primary)
                    
                    
//                    print(#function, cityName)
                    TextField("Enter username...", text: $username, onEditingChanged: { (changed) in
                        print("Username onEditingChanged - \(changed)")
                    }) {
                        print("Username onCommit")
                    }
                    
                    Text("Your username: \(username)")
                    
                    
                    
                    
                    
                    
                    
//
//                    TextField("Enter City name", text: self.$forecastViewModel.cityName) {
//                        self.forecastViewModel.searchCity()
//                    }
                    
                }.padding(.all, 10)
                
                //                    .frame(width: UIWidth - 50, height: 50)
                //                    .background(Color("lightBlue"))
                //                    .cornerRadius(30)
                //                    .foregroundColor(.white)
                //                    .offset(x: self.showField ? 0 : (-UIWidth / 2 - 180))
                //                    .animation(.spring())
                //
                //                Image(systemName: "magnifyingglass.circle.fill")
                //                    .resizable()
                //                    .frame(width: 40, height: 40)
                //                    .foregroundColor(.white)
                //                    .offset(x: self.showField ? (UIWidth - 90) : -30)
                //                    .animation(.spring())
                //                    .onTapGesture {
                //                        self.showField.toggle()
                //                }
                
            } //.onAppear(perform: fetch)
        }
        
    }
    
//    private func fetch() {
//        self.forecastViewModel.searchCity()
//    }
}


