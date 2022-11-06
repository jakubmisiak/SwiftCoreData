//
//  CoreDataAppApp.swift
//  CoreDataApp
//
//  Created by Jakub Misiak on 06/11/2022.
//

import SwiftUI

@main
struct CoreDataAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
