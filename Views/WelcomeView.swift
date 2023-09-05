//
//  WelcomeView.swift
//
// This view lets the user make a cast and connects them to a view (Interpretation View) that shows their cast details. This view also includes a button that connects the user to their saved casts.
//
//  Created by Devin Ercolano on 11/16/22.
//

import CoreData
import SwiftUI

struct WelcomeView: View {
    @Binding public var casts: [CastResult]
    @State private var isShowingInterpretationView = false
    @State var finalResult: CastResult = CastResult(odu: "Okanran - Ilera", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Good health and success!", title: "")
    @State var result: [CastResult] = []
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.limeCream
                VStack(spacing: 12) {
                    Text("Aalaffia!")
                        .font(Font.custom("JustAnotherHand-Regular", size: 58, relativeTo: .title))
                        .onShake {
                            finalResult = CastResult.data.randomElement() ?? CastResult(odu: "Did not work", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Good health and success!", title: "")
                            isShowingInterpretationView = true;
                        }
                    Image("kola-nuts")
                        .resizable()
                        .frame(width: 300, height: 300)
                    Button {
                        finalResult = CastResult.data.randomElement() ?? CastResult(odu: "Did not work", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Good health and success!", title: "")
                        isShowingInterpretationView = true;
                    } label: {
                        Text("Cast")
                            .font(Font.custom("JustAnotherHand-Regular", size: 50, relativeTo: .title))
                    }
                    .font(.system(size:45)) // prefered to title
                    .foregroundColor(Color.white) // font color
                    .padding()
                    .background(Color.kiwi)
                    .fontWeight(.bold)
                    .cornerRadius(45)
                    .shadow(radius: 20)
                    }
                
            .foregroundColor(Color.forrest)
            .navigationDestination(isPresented: $isShowingInterpretationView) {
                InterpretationView(result: finalResult)
            }
            .padding()
            .background(Color.limeCream)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CastsListView(saveAction: {})) {
                        Image(systemName: "list.bullet.circle")
                    }
                }
            }
            }
            
            .ignoresSafeArea(.all)
        }.ignoresSafeArea(.all)
    }
}



extension Color {
    static let kiwi = Color("kiwi")
    static let limeCream = Color("limeCream")
    static let forrest = Color("forrest")
}

// The notification of shake gesture.
extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

//  Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}

// A view modifier that detects shaking and calls a function of our choosing.
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

// A View extension to make the modifier easier to use.
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                action(UIDevice.current.orientation)
            }
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification).dropFirst()) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

//struct WelcomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView()
//    }
//}
