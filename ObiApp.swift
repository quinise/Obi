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
    @State var castResult = CastResult(odu: "Test Odu", date: Date(), yesNoMaybe: "Maybe", maleObi1: 0, maleObi2: 0, femaleObi1: 0, femaleObi2: 0, interpretation: "interpretation")
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                WelcomeView(casts: $castData.casts, result: castResult)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .onAppear {
                castData.load()
            }
        
        }
    
    }
}
