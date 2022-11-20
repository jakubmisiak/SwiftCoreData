//
//  CoreDataAppApp.swift
//  CoreDataApp
//
//  Created by Jakub Misiak on 06/11/2022.
//

import SwiftUI

@main
struct CoreDataAppApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
