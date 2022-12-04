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
    
    
    // ToDo this view needs more space between the title and YesNoMaybe property in landscape mode, this also needs to cover horizontal safeareas in portrait mode
    var body: some View {
        let cast = result
        let db = Cast(context: controller.container.viewContext)

        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.kiwi, Color.limeCream]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack(spacing: 12) {
                    Text((cast.yesNoMaybe)).font(.title)
                    Text(dateFormatter.string(from: cast.timestamp))
                    Text(cast.interpretation)
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
                        print(title)
                        presentAlert = true
                    }
                    .buttonStyle(.bordered)
                    .background(Color.kiwi)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .cornerRadius(30)
                    .shadow(radius: 20)
                    .alert("Cast Title", isPresented: $presentAlert, actions: {
                        TextField("Cast Title", text: $title)
                        Button("Save", action: {
                            //ToDo data validation on title, must not be code
                            var castResult = CastResult(odu: cast.odu, timestamp: cast.timestamp, yesNoMaybe: cast.yesNoMaybe, maleObi1: cast.maleObi1, maleObi2: cast.maleObi2, femaleObi1: cast.femaleObi1, femaleObi2: cast.femaleObi2, interpretation: cast.interpretation, title: title)
                            castResult.title = title
                            castResults.append(castResult)
                            controller.save(castResults)
                            if let encoded = try? JSONEncoder().encode(castResults) {
                                UserDefaults.standard.set(encoded, forKey: "cast")
                            }
                        })
                        Button("Cancel", role: .cancel, action: {})
                    }, message: {
                        Text("Please enter a title")
                    })
                }
            }
            .padding()
            .navigationTitle(cast.odu)
            .toolbar {  
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CastsListView(cast: castResults).environmentObject(controller)) {
                        Image(systemName: "list.bullet.circle")
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

//struct InterpretationView_Previews: PreviewProvider {
//    static var previews: some View {
//        InterpretationView(result: CastResult(odu: "Ejife-Ero", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Up", interpretation: "calmness and whole-mindedness"))
//    }
//}
