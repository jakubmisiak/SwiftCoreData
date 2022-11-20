//
//  AddTravelView.swift
//  CoreDataApp
//
//  Created by Jakub Misiak on 14/11/2022.
//

import SwiftUI

struct AddTravelView: View {
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var price = 0
    @State private var description = ""
    var body: some View {
        Form{
            Section{
                TextField("Travel name:", text: $name)
                
                TextField("Enter your price", value: $price, format: .number)
                    .textFieldStyle(.roundedBorder)
                
                DatePicker(
                    "Start Date",
                    selection: $startDate,
                    displayedComponents: [.date]
                )
                
                DatePicker(
                    "End Date",
                    selection: $startDate,
                    displayedComponents: [.date]
                )
                
                TextField("Description:", text: $description)
                
                HStack{
                    Spacer()
                    Button("Save"){
                        DataController().addTravel(name: name, startDate: startDate, endDate: endDate, price: price, travelDescription: description, context: managedObjContext)
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

struct AddTravelView_Previews: PreviewProvider {
    static var previews: some View {
        AddTravelView()
    }
}
