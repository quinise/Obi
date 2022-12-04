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
    init() {
        let dataController = CoreDataController()
        _controller = StateObject(wrappedValue: dataController)
    }
    @Environment(\.scenePhase) var scenePhase
    @StateObject var controller: CoreDataController
//    @StateObject private var castData = CastData()
    
    var body: some Scene {
        WindowGroup {
                SplashScreenView()
                    .environment(\.managedObjectContext, controller.container.viewContext)
                    .environmentObject(controller)
        }
        .onChange(of: scenePhase) { newValue in
            controller.save()
        }
    
    }
}
