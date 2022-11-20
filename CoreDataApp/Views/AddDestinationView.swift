//
//  AddDestinationView.swift
//  CoreDataApp
//
//  Created by Jakub Misiak on 17/11/2022.
//

import SwiftUI

struct AddDestinationView: View {
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var altitude = ""
    @State private var longitude = ""
    @State var travel: Travel
    var body: some View {
        Form{
            Section{
                TextField("Travel name:", text: $name)
                
                TextField("Enter altitude:", text: $altitude)
            
                
                TextField("Enter longitude:", text: $longitude)
                
                HStack{
                    Spacer()
                    Button("Save"){
                        DataController().addDestination(name: name, altitude: altitude, longitude: longitude, travel: travel, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button("Cancel"){
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}


