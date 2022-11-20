//
//  TravelView.swift
//  CoreDataApp
//
//  Created by Jakub Misiak on 14/11/2022.
//

import SwiftUI

struct TravelView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @State var travel: Travel
    @State private var showingAddView = false
    var body: some View {
        VStack{
            TravelAttributeView(label: "Name: ", value: travel.name ?? "Test")
            DateView(label: "Date from:", value: travel.startDate ?? Date())
            DateView(label: "Date to:", value: travel.endDate ?? Date())
            TravelAttributeView(label: "Price", value: String(travel.price))
            TravelAttributeView(label: "Description:", value: travel.travelDescription ?? "Test")
            List{
                
                if let destinationsSet = travel.relationship,  let destination = destinationsSet.allObjects as? [Destination] {
                    ForEach(destination) { d in
                        HStack{
                            VStack{
                                Text("Name: \(d.name!)").bold()
                                HStack{
                                    Text("Altitude:  \(d.altitude!)").font(.system(size: 12))
                                    Text("Longitude:  \(d.longitude!)").font(.system(size: 12))
                                }
                            }
                    }
                }
                
                ForEach(destination){
                    destination in
                        
                            
                        }
                }
            }
        }.navigationTitle("Travel details").toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingAddView.toggle()
                } label: {
                    Label("Add destination", systemImage: "plus.circle")
                }
            }
        }
        .sheet(isPresented: $showingAddView) {
            AddDestinationView(travel: travel)
        }
    }
    
}

