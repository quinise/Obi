//
//  WelcomeView.swift
//  Obi
//
//  Created by Devin Ercolano on 11/16/22.
//
import SwiftUI

struct WelcomeView: View {
    @Binding  public var casts: [CastResult]
    @State var result: CastResult
    @State var isCastViewPresented = false
        
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                Text("Aalaffia, NAME")
                Button("Cast") {
                    isCastViewPresented = true
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                .fullScreenCover(isPresented: $isCastViewPresented) {
                    InterpretationView(casts: $casts, result: result)
                }
            }
        }
        .padding()
        .navigationTitle("Mobi")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: CastsListView()) {
                    Image(systemName: "list.bullet.circle")
                }
            }
        }
        
    }
        
}


//struct WelcomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView()
//    }
//}
