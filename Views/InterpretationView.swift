//
//  InterpretationView.swift
//  MyObi
//
//  Created by Devin Ercolano on 11/16/22.
//

import SwiftUI

struct InterpretationView: View {
    @Binding var casts: [CastResult]
    let result: CastResult
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        let cast = casts.randomElement()
        
        NavigationView {
            ScrollView {
            LazyVStack(spacing: 12) {
                Text((cast!.yesNoMaybe)).font(.title)
                Text(dateFormatter.string(from: cast!.date))
                Text(cast!.interpretation)
                Button("Save Cast"){
                    
                }
            };
            }
            .padding()
            .navigationTitle(cast!.odu)
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
