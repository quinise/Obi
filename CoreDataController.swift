//
//  CoreDataController.swift
//  Obi
//
//  Created by Devin Ercolano on 11/26/22.
//

import CoreData // a wrapper (sql methods) around the sql database
import SwiftUI

class CoreDataController: ObservableObject {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Obi")
        container.loadPersistentStores { des, err in
            if let err {
                fatalError("Fatal Error \(err.localizedDescription)")
            }
        }
    }

    func save(_ objects: [CastResult]) {
        for object in objects {
            let cast = Cast(context: container.viewContext)
            cast.title = object.title
            cast.odu = object.odu
            cast.timestamp = object.timestamp
            cast.yesNoMaybe = object.yesNoMaybe
            cast.interpretation = object.interpretation
            cast.femaleObi1 = object.femaleObi1
            cast.femaleObi2 = object.femaleObi2
            cast.maleObi1 = object.maleObi1
            cast.maleObi2 = object.maleObi2
            try? container.viewContext.save()
        }
    }
    
    func save() {
        if container.viewContext.hasChanges {
            try? container.viewContext.save()
        }
    }
    
    func delete(_ obj: NSManagedObject) {
        container.viewContext.delete(obj)
    }
}
