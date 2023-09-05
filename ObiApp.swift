//
//  ObiApp.swift
//  Obi - this application casts IFA Obi divination for the user. Each divine can be saved(Created, Deleted) as a cast in Core Data.
//
//  Created by Devin Ercolano on 11/16/22.
//

import SwiftUI
import CoreData

@main
struct ObiApp: App {
    @ObservedObject private var castData = CastData()
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SplashScreenView(casts: .constant(CastResult.data))
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }

            .onAppear {
                castData.load()
            }
        }
    }
}
