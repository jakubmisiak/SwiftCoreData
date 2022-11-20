//
//  DataController.swift
//  CoreDataApp
//
//  Created by Jakub Misiak on 14/11/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataApp")
    
    init() {
        container.loadPersistentStores{desc , error in
            if let error = error{
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data saved")
        }catch{
            print("We could not save the data")
        }
    }
    
    func addTravel(name: String, startDate: Date, endDate: Date, price: Int, travelDescription: String, context: NSManagedObjectContext){
        let travel = Travel(context: context)
        travel.name = name
        travel.startDate = startDate
        travel.endDate = endDate
        travel.travelDescription = travelDescription
        travel.price = Int16(price)
        
        
        save(context: context)
    }
    
    func addDestination(name: String, altitude: String, longitude: String, travel: Travel, context: NSManagedObjectContext){
        let destination = Destination(context: context)
        destination.name = name
        destination.longitude = longitude
        destination.altitude = altitude
        
        travel.addToRelationship(destination)
        
        save(context: context)
    }
}
