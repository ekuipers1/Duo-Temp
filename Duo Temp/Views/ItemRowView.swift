//
//  ItemRowView.swift
//  MyCoreToDo
//
//  Created by Erik Kuipers on 5/8/20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct ItemRowView: View {
    
    var currentCity:String = ""
//original code
//  var dateCreated:String = ""
    var dateCreated:Date = Date()
//    var priority:String = ""
    
    var body: some View {
        HStack{
//            Text(priority)
//            .font(.headline)
            
            VStack(alignment: .leading) {
                Text(currentCity)
                    .font(.headline)
                
//                Text("\(dateCreated)")
//                    .font(.custom("Ariel", size: 10))
//                    .lineLimit(3)
//original code
//                Text(dateCreated)
//                    .font(.caption)
            }
        }
     }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
       ItemRowView().previewLayout(.sizeThatFits)
    }
}


