//
//  ContentView.swift
//  CoreDataApp
//
//  Created by Jakub Misiak on 06/11/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.startDate, order: .reverse)]) var travel: FetchedResults<Travel>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                List{
                    ForEach(travel){
                        travel in
                        NavigationLink(destination: TravelView(travel: travel)){
                            HStack{
                                VStack{
                                    Text("\(travel.name!)").bold()
                                    Text("Price \(travel.price)$").font(.system(size: 12))
                                }
                                
                            }
                        }
                    }.onDelete(perform: deleteTravel)
                }
            }.navigationTitle("Travels").toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add travel", systemImage: "plus.circle")
                    }
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddTravelView()
            }
        }
    }
    
    private func deleteTravel(offsets: IndexSet){
        offsets.map { travel[$0] }
        .forEach(managedObjContext.delete)
        
        // Saves to our database
        DataController().save(context: managedObjContext)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
