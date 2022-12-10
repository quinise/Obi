//
//  InterpretationView.swift
//  MyObi
//
//  Created by Devin Ercolano on 11/16/22.
//

import SwiftUI

struct InterpretationView: View {
    @EnvironmentObject var controller: CoreDataController
    @State private var presentAlert = false
    @State private var title: String = ""
    @Environment(\.presentationMode) var presentationMode
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var Obi: FetchedResults<Cast>
    let request = FetchRequest<Cast>(entity:Cast.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Cast.timestamp, ascending: true)])
    @State var castResult: [Cast] = []
    @State var castResults: [CastResult] = []
    @State var result: CastResult
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    var body: some View {
        let cast = result

            ZStack {
                Color.limeCream
                    .ignoresSafeArea(.all, edges: .all)
                VStack(spacing: 12) {
                    Text(cast.odu).font(Font.custom("Acme-Regular", size: 25, relativeTo: .title))
                    Text((cast.yesNoMaybe))
                        .font(Font.custom("Archivo-VariableFont_wdth,wght", size: 15, relativeTo: .title))
                    Text(dateFormatter.string(from: cast.timestamp)).font(Font.custom("Archivo-VariableFont_wdth,wght", size: 15, relativeTo: .title))
                    Text(cast.interpretation).font(Font.custom("Archivo-VariableFont_wdth,wght", size: 15, relativeTo: .title))
                        .padding()
                    HStack {
                        Image(cast.maleObi1)
                            .resizable()
                            .scaledToFit()
                        Image(cast.maleObi2)
                            .resizable()
                            .scaledToFit()
                        Image(cast.femaleObi1)
                            .resizable()
                            .scaledToFit()
                        Image(cast.femaleObi2)
                            .resizable()
                            .scaledToFit()
                    }
                        .padding()
                    Button("Save Cast") {
                        presentAlert = true
                    }
                    .buttonStyle(.bordered)
                    .background(Color.kiwi)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(Font.custom("Archivo-VariableFont_wdth,wght", size: 15, relativeTo: .title))
                    .cornerRadius(30)
                    .shadow(radius: 20)
                    .alert("Cast Title", isPresented: $presentAlert, actions: {
                        TextField("Cast Title", text: $title).font(Font.custom("Archivo-VariableFont_wdth,wght", size: 15, relativeTo: .title))
                        Button("Save", action: {
                            var castResult = CastResult(odu: cast.odu, timestamp: cast.timestamp, yesNoMaybe: cast.yesNoMaybe, maleObi1: cast.maleObi1, maleObi2: cast.maleObi2, femaleObi1: cast.femaleObi1, femaleObi2: cast.femaleObi2, interpretation: cast.interpretation, title: title)
                            castResult.title = title
                            castResults.append(castResult)
                            controller.save(castResults)
                            if let encoded = try? JSONEncoder().encode(castResults) {
                                UserDefaults.standard.set(encoded, forKey: "cast")
                            }
                        })
                        Button("Cancel", role: .cancel, action: {}).font(Font.custom("Archivo-VariableFont_wdth,wght", size: 15, relativeTo: .title))
                    }, message: {
                        Text("Please enter a title").font(Font.custom("Archivo-VariableFont_wdth,wght", size: 15, relativeTo: .title))
                    })
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CastsListView(cast: castResults).environmentObject(controller)) {
                        Image(systemName: "list.bullet.circle")
                    }
                }
            }
            .background(Color.limeCream)
    }
}

//struct InterpretationView_Previews: PreviewProvider {
//    static var previews: some View {
//        InterpretationView(result: CastResult(odu: "Ejife-Ero", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Up", interpretation: "calmness and whole-mindedness"))
//    }
//}
