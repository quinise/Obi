//
//  InterpretationView.swift
//  MyObi
//
//  Created by Devin Ercolano on 11/16/22.
//

import SwiftUI

struct InterpretationView: View {
    @Binding var casts: [CastResult]
    @State var result: CastResult
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
            LazyVStack(spacing: 12) {
                Text((result.yesNoMaybe)).font(.title)
                Text(dateFormatter.string(from: result.date))
                Text(result.interpretation)
                Button("Save Cast"){
                    
                }
            };
            }
            .padding()
            .navigationTitle(result.odu)
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
