//
//  WelcomeView.swift
//  Obi
//
//  Created by Devin Ercolano on 11/16/22.
//

import CoreData
import SwiftUI

extension Color {
    static let kiwi = Color(red: 141 / 255, green: 179 / 255, blue: 0 / 255)
    static let limeCream = Color(red: 240 / 255, green: 250 / 255, blue: 202 / 255)
    static let forrest = Color(red: 34/255, green: 139/255, blue: 34/255)
}

// The notification we'll send when a shake gesture happens.
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

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

struct WelcomeView: View {
    @State private var orientation = UIDeviceOrientation.unknown
    @State var isCastViewPresented = false
    @EnvironmentObject var controller: CoreDataController
    @State var finalResult: CastResult = CastResult(odu: "Okanran - Ilera", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Good health and success!", title: "")
    let request = FetchRequest<Cast>(entity:Cast.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Cast.timestamp, ascending: true)])
    let result: [CastResult] = [
        CastResult(odu: "Aalaffia - Ogbe", timestamp: Date(), yesNoMaybe: "Yes", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Up", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Up", interpretation: "Symbolizes good general welfare", title: ""),
        CastResult(odu: "Yeku - Oyeku", timestamp: Date(), yesNoMaybe: "No", maleObi1: "MaleObi1Down", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "No light - potential delays and possible protection from ancestors...", title: ""),
        CastResult(odu: "Okanran - Ilera", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Good health and success!", title: ""),
        CastResult(odu: "Okanran - Ilera", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Down", maleObi2: "MaleObi2Up", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Good health and success!", title: ""),
        CastResult(odu: "Okanran-Aje", timestamp: Date(), yesNoMaybe: "No", maleObi1: "MaleObi1Down", maleObi2: "MaleObi2Up", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Abundance", title: ""),
        CastResult(odu: "Okanran-Aje", timestamp: Date(), yesNoMaybe: "No", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Abundance", title: ""),
        CastResult(odu: "Okanran-Aje", timestamp: Date(), yesNoMaybe: "No", maleObi1: "MaleObi1Down", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Down", interpretation: "Abundance", title: ""),
        CastResult(odu: "Okanran-Aje", timestamp: Date(), yesNoMaybe: "No", maleObi1: "MaleObi1Down", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Up", interpretation: "Abundance", title: ""),
        CastResult(odu: "Ejife-Ejire", timestamp: Date(), yesNoMaybe: "Yes", maleObi1: "MaleObi1Down", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Up", interpretation: "criminality, arguments", title: ""),
        CastResult(odu: "Ejife-Ero", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Up", interpretation: "calmness and whole-mindedness", title: ""),
        CastResult(odu: "Ejife-Ero", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Down", maleObi2: "MaleObi2Up", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Up", interpretation: "calmness and whole-mindedness", title: ""),
        CastResult(odu: "Obita-Etawa", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Down", maleObi2: "MaleObi2Up", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Up", interpretation: "No arguments, living harmoniously", title: ""),
        CastResult(odu: "Obita-Etawa", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Up", interpretation: "No arguments, living harmoniously", title: ""),
        CastResult(odu: "Akita-Etawa", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Up", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Up", interpretation: "Hard work is rewarded", title: ""),
        CastResult(odu: "Akita-Etawa", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Up", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Down", interpretation: "Hard work is rewarded", title: "")
       ]
    
    @ViewBuilder var subView : some View {
        NavigationView {
            VStack(spacing: 12) {
                Text("Aalaffia!").bold()
                    .font(.system(size: 58))
                    .onShake {
                        isCastViewPresented = true
                        finalResult = result.randomElement() ?? CastResult(odu: "Okanran - Ilera", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Good health and success!", title: "")
                    }
                Image("kola-nuts")
                    .resizable()
                    .frame(width: 300, height: 300)
                Button("Cast") {
                    isCastViewPresented = true
                    finalResult = result.randomElement() ?? CastResult(odu: "Okanran - Ilera", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Good health and success!", title: "")
                }
                .background(.white) // TODO add space around button text
                .font(.system(size:32)) // prefered to title
                .foregroundColor(Color.forrest) // font color
                .padding()
                .border(Color.forrest, width: 3)
                .cornerRadius(5)
                .fullScreenCover(isPresented: $isCastViewPresented) {
                    InterpretationView(result: finalResult).environmentObject(controller)
                }
            }
        }
        .padding()
        .navigationTitle("Mobi")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: CastsListView(cast: result).environment(\.managedObjectContext, controller.container.viewContext).environmentObject(controller)) {
                    Image(systemName: "list.bullet.circle")
                }
            }
        }
    }
    var body: some View {
        Group {
            if orientation.isLandscape {
                ScrollView(.vertical, showsIndicators: false) { //ToDo scroll not scrolling all the way down
                    subView
                }
            } else {
                VStack {
                    subView
                    Spacer()
                }
            }
        }
        .padding(.top, 10)
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
        
}


//struct WelcomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView()
//    }
//}
