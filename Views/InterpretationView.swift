//
//  InterpretationView.swift
//  MyObi
//
//  Created by Devin Ercolano on 11/16/22.
//

import SwiftUI

struct InterpretationView: View {
    @State private var presentAlert = false
    @State private var title: String = ""
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    let persistenceController = PersistenceController.shared
    @FetchRequest(sortDescriptors: [SortDescriptor(\.odu)]) var Obi: FetchedResults<Cast>
    @Binding var casts: [CastResult]
    let result: CastResult
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    var body: some View {
        let cast = casts.randomElement()
        let db = Cast(context: moc)

        NavigationView {
            ScrollView {
            LazyVStack(spacing: 12) {
//                Text((cast!.yesNoMaybe)).font(.title)
//                Text(dateFormatter.string(from: cast!.date))
//                Text(cast!.interpretation)
                Button("Save Cast") {
                    presentAlert = true
                    db.odu = "working!"
                        PersistenceController.shared.save()
                }
                Text(title)
                List (Obi) { obi in
                    Text(obi.odu ?? "uknown")
                    
                }
                Text("After List")
//                .alert("Cast Title", isPresented: $presentAlert, actions:{
//                    TextField("Title", text: $title)
//
//                    Button("Save", action: {})
//                    Button("Cancel", role: .cancel, action: {}) //ToDo: don't refresh screen on alert-button press
//                }, message: {
//                    Text("Please enter a title")
//                })
            }
            }
            .padding()
//            .navigationTitle(cast!.odu)
            .toolbar {  
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                }
            }
        }
    }
}

//struct InterpretationView_Previews: PreviewProvider {
//    static var previews: some View {
//        InterpretationView()
//    }
//}
