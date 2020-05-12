//
//  CityListView.swift
//  Duo Temp
//
//  Created by Erik Kuipers on 5/8/20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct CityListView: View {

    @Environment(\.managedObjectContext) var managedObjectContext
    
    //THIS SORTS BY DATE
    @FetchRequest(entity: Duo_Temp.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Duo_Temp.dateCreated, ascending: false)])
    
    //OTHER SORTING OPTIONS TO CHECK OUT...THESE WILL SORT BY PRIORITY OR BY ITEM ALPHABETICALLY
    //        @FetchRequest(entity: ToDoList.entity(), sortDescriptors: [
    //            NSSortDescriptor(keyPath: \ToDoList.item, ascending: true),
    //            NSSortDescriptor(keyPath: \ToDoList.priority, ascending: false),
    //            NSSortDescriptor(keyPath: \ToDoList.dateCreated, ascending: false)])
    
    var fetchedItems: FetchedResults<Duo_Temp>
    
    
    @State private var toDoItem = ""
    @State var setPriority = ""
    
    
    
    
////    @Environment(\.presentationMode) var presentationMode
//    @Environment(\.managedObjectContext) var managedObjectContext
//    //THIS SORTS BY DATE
//    @FetchRequest(entity: Duo_Temp.entity(), sortDescriptors: [
//        NSSortDescriptor(keyPath: \Duo_Temp.dateCreated, ascending: false)])
//
//    var fetchedItems: FetchedResults<Duo_Temp>
    @State private var myCityItem = ""
    
    var body: some View {
        VStack {
            
            
            NavigationView {
                
                List {
                    
                    HStack {
                        TextField("Add new item", text: self.$myCityItem)
                            .padding(.all, 2)
                            .font(Font.system(size: 25, design: .default))
                            .multilineTextAlignment(.center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button(action: {
                            guard self.myCityItem != "" else { return } //removes the possibility of empty cells
                            let MyCityItem = Duo_Temp(context: self.managedObjectContext)
                            MyCityItem.city = self.myCityItem
                            MyCityItem.dateCreated = Date()
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                // print the Core Data error
                                print(error.localizedDescription)
                            }
                            self.myCityItem = ""
                        }){
                            Image(systemName: "plus.circle")
                                .foregroundColor(.white)
                                .imageScale(.large)
                        }
                    }
                    
                    ForEach(fetchedItems, id: \.self) { myCityItems in
                        
                        ItemRowView(currentCity: myCityItems.city ?? "Empty");
                        
                        
                        
                    }.onDelete(perform: removeItems)
                    //color the whole text in the list with this - .colorMultiply(Color.green).padding(.top)
                    //colors the list rows green - .listRowBackground(Color.green.opacity(0.1))
                    //or use this color initializer - Color(red: 1.0, green: 0, blue: 1.0, opacity: 0.2)
                                }.navigationBarTitle(Text("My To Do's"))
                                    .navigationBarItems(trailing: EditButton())
                                    .foregroundColor(.white)
                            }
                                //add a dark mode theme
                                .environment(\.colorScheme, .dark)
                        }
                    }
        func removeItems(at offsets: IndexSet) {
            for index in offsets {
                let city = fetchedItems[index]
                managedObjectContext.delete(city)
                
            }
            do {
                try managedObjectContext.save()
            } catch {
                // print the Core Data error
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    
    struct CityListView_Previews: PreviewProvider {
        static var previews: some View {
            CityListView()
        }
    }
    

