//
//  DateView.swift
//  CoreDataApp
//
//  Created by Jakub Misiak on 17/11/2022.
//

import SwiftUI

struct DateView: View {
    let label: String
    let value: Date
    
    var body: some View {
        VStack(spacing: 12) {
                VStack(spacing: 4){
                    Text("\(label)").frame(maxWidth: .infinity, alignment: .leading)
                    Text(value, style: .date).frame(maxWidth: .infinity, alignment: .leading)
                }.padding(.all)
            }.frame(width: 300, height: 70)
            .background(Color(.quaternarySystemFill))
            .cornerRadius(10)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(label: "Test", value: Date())
    }
}
