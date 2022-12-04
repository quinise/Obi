//
//  CastsListView.swift
//  Obi
//
//  Created by Devin Ercolano on 11/16/22.
//

import SwiftUI
import CoreData

//ToDo connect the welcome view to this view
struct CastsListView: View {
    @EnvironmentObject var controller: CoreDataController
    @State var cast: [CastResult]
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var castList: FetchedResults<Cast>
    @FetchRequest(sortDescriptors: []) var casts: FetchedResults<Cast>
//    @State var cast: Cast!
    
    var body: some View {
        ZStack {
            Color.limeCream
                .ignoresSafeArea()
            List {
                ForEach(cast) { cast in
                    NavigationLink (destination: CastView(cast: cast)) {
                        Text(cast.title ?? "")
                            .foregroundColor(Color.forrest)
                    }
                }
                .onDelete(perform: removeAtIndices)
            }
            .foregroundColor(Color.forrest)
            .onAppear {
                if let data = UserDefaults.standard.object(forKey: "cast") as? Data,
                   let castData = try? JSONDecoder().decode([CastResult].self, from: data) {
                    cast = castData
                }
            }
        }
    }
    
    func getData() -> Cast {
        let cast = Cast(context: controller.container.viewContext)
        return cast
    }
    
    func removeAtIndices(at offsets: IndexSet) {
        for offset in offsets {
            let cast = casts[offset]
            controller.delete(cast)
        }
        
        controller.save()
    }
}

//struct CastsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CastsListView()
//    }
//}
