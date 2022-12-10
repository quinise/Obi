//
//  CastsListView.swift
//  Obi
//
//  Created by Devin Ercolano on 11/16/22.
//

import SwiftUI
import CoreData

struct CastsListView: View {
    @EnvironmentObject var controller: CoreDataController
    @State var cast: [CastResult]
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var castList: FetchedResults<Cast>
    @FetchRequest(sortDescriptors: []) var casts: FetchedResults<Cast>
    
    var body: some View {
        ZStack {
            Color.limeCream
        Text("Previous Readings") // Todo: this is not visible
            .font(Font.custom("Acme-Regular", size: 20, relativeTo: .title))
        List {
            ForEach(cast) { cast in
                NavigationLink (destination: CastView(cast: cast)) {
                    Text(cast.title)
                        .foregroundColor(Color.forrest)
                        .font(Font.custom("Archivo-VariableFont_wdth,wght", size: 15, relativeTo: .title))
                }
            }
            .onDelete(perform: removeAtIndices)
        }
        .background(Color.limeCream)
        .scrollContentBackground(.hidden)
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
