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
    let formatted = Date().formatted(
        .dateTime
            .day().month().year()
    )
    
    var body: some View {
        NavigationView {
            ScrollView {
            LazyVStack(spacing: 12) {
                    Text((String)(result.yesNoBoolean)).font(.title)
                let formatted = Date().formatted(.iso8601)
                    ForEach(casts, id: \.id, content: { cast in
                        Text(cast.odu).font(.title)
                    });
                };
            }
            .padding()
            .navigationTitle(result.odu)
        }
    }
}

//struct InterpretationView_Previews: PreviewProvider {
//    static var previews: some View {
//        InterpretationView()
//    }
//}
