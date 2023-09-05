//
//  CastsListView.swift
//  This view displays a list of saved cast with the options to delete one or select it and see it's details.
//
//  Created by Devin Ercolano on 11/16/22.
//

import SwiftUI
import CoreData

struct CastsListView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest<Cast>(entity: Cast.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Cast.timestamp, ascending: true)])
    var casts: FetchedResults<Cast>
    
    let saveAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.limeCream
        Text("Previous Readings") // Todo: this is not visible
            .font(.custom("Sriracha-Regular", size: 20, relativeTo: .title))
        List {
            ForEach(casts, id: \.id) { cast in
                NavigationLink(destination: CastView(cast: cast)) {
                    Text(cast.title ?? "")
                        .foregroundColor(Color.forrest)
                        .font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                }
            }
            .onDelete(perform: deleteItems)
        }
        .background(Color.limeCream)
        .scrollContentBackground(.hidden)
        .foregroundColor(Color.forrest)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            managedObjectContext.perform {
                offsets.map { casts[$0] }.forEach(managedObjectContext.delete)
                
                do {
                    try managedObjectContext.save()
                } catch {
                    #if DEBUG
                    fatalError()
                    #endif
                }
            }
        }
    }
}

//struct CastsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CastsListView()
//    }
//}
