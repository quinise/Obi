//
//  SplashScreenView.swift
//  This view is an animation that greets the user.
//
//  Created by Devin Ercolano on 11/23/22.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding public var casts: [CastResult]
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.3
    @State var animate = false
    @State var endSplash = false
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
       ZStack {
           // Provides a destination, after the animation
           WelcomeView(casts: .constant(CastResult.data))
            ZStack {
                Color("Color.kiwi")
                Image("kola-nuts-xs")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fit : .fit)
                    .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                    .scaleEffect(animate ? 3 : 1)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
            .onAppear {
                withAnimation(.easeIn(duration: 3.5)) {
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.isActive = true
            }
        }
    }
    
    func animateSplash() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                withAnimation(Animation.easeOut(duration: 1.00)) {
                    animate.toggle()
                }
                
                withAnimation(Animation.easeOut(duration: 1.00)) {
                    endSplash.toggle()
                }
            }
        }
}

//struct SplashScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        SplashScreenView()
//    }
//}
