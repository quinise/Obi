//
//  ObiApp.swift
//  Obi
//
//  Created by Devin Ercolano on 11/16/22.
//

import SwiftUI
import CoreData

@main
struct ObiApp: App {
    @ObservedObject private var castData = CastData()
    @State var castResult = CastResult(title: "Test Title", odu: "Test", date: Date(), yesNoBoolean: false, interpretation: "interpretation")
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                WelcomeView(casts: $castData.casts, result: castResult)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .onAppear {
                castData.load()
            }
        
        }
    
    }
}
