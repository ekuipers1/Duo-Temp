//
//  BackSplash.swift
//  Duo Temp
//
//  Created by Erik Kuipers on 4/22/20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct BackSplash: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color("gradient2"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct BackSplash_Previews: PreviewProvider {
    static var previews: some View {
        BackSplash()
    }
}
