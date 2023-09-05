//
//  InterpretationView.swift
//  This view shows the user the details of a cast that they just made by clicking the cast button in the Welcome View.
//
//  Created by Devin Ercolano on 11/16/22.
//

import SwiftUI

struct InterpretationView: View {
    @State private var presentAlert = false
    @State var result: CastResult
    @State private var timestampObject = Date()
    @State private var yesNoMaybeString = ""
    @State private var maleObi1String = ""
    @State private var maleObi2String = ""
    @State private var femaleObi1String = ""
    @State private var femaleObi2String = ""
    @State private var interpretationString = ""
    @State private var titleString = ""
    @State private var oduString = ""
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
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
                    Text(cast.odu).font(.custom("Sriracha-Regular", size: 25, relativeTo: .title))
                    Text((cast.yesNoMaybe))
                        .font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                    Text(dateFormatter.string(from: cast.timestamp)).font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                    Text(cast.interpretation).font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
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
                    .font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                    .cornerRadius(30)
                    .shadow(radius: 20)
                    .alert("Cast Title", isPresented: $presentAlert, actions: {
                        TextField("Cast Title", text: $titleString).font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                        Button("Save", action: {
                            self.saveCast()
                        })
                        Button("Cancel", role: .cancel, action: {}).font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                    }, message: {
                        Text("Please enter a title").font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                    })
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CastsListView(saveAction: {})) {
                        Image(systemName: "list.bullet.circle")
                    }
                }
            }
            .background(Color.limeCream)
    }
    
    private func saveCast() {
            let newCast = Cast(context: self.managedObjectContext)
                newCast.id = UUID()
                newCast.title = titleString
                newCast.odu = result.odu
                newCast.interpretation = result.interpretation
                newCast.yesNoMaybe = result.yesNoMaybe
                newCast.maleObi1 = result.maleObi1
                newCast.maleObi2 = result.maleObi2
                newCast.femaleObi1 = result.femaleObi1
                newCast.femaleObi2 = result.femaleObi2
                newCast.timestamp = result.timestamp
                
            do {
                try self.managedObjectContext.save()
                //Always a good idea to dimiss after saving
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                self.managedObjectContext.delete(newCast)
//                self.dataAlert.toggle()
                //            #if DEBUG
                //            fatalError()
                //            #endif
            }
        }
}

//struct InterpretationView_Previews: PreviewProvider {
//    static var previews: some View {
//        InterpretationView(result: CastResult(odu: "Ejife-Ero", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Up", interpretation: "calmness and whole-mindedness"))
//    }
//}
