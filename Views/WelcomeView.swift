//
//  WelcomeView.swift
//  Obi
//
//  Created by Devin Ercolano on 11/16/22.
//

import CoreData
import SwiftUI

struct WelcomeView: View {
    @State private var orientation = UIDeviceOrientation.unknown
    @State private var isShowingInterpretationView = false
    @EnvironmentObject var controller: CoreDataController
    @State var finalResult: CastResult = CastResult(odu: "Okanran - Ilera", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Good health and success!", title: "")
    let request = FetchRequest<Cast>(entity:Cast.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Cast.timestamp, ascending: true)])
    @State var result: [CastResult] = []
    
    
    init () {
        for familyName in UIFont.familyNames {
            print(familyName)
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("-- \(fontName)")
            }
        }
        
        
        
        if let data = UserDefaults.standard.object(forKey: "cast") as? Data,
           let castData = try? JSONDecoder().decode([CastResult].self, from: data) {
            result = castData
            print(result)
    }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.limeCream
                VStack(spacing: 12) {
                    Text("Aalaffia!")
                        .font(Font.custom("JustAnotherHand-Regular", size: 58, relativeTo: .title))
                        .onShake {
                            finalResult = result.randomElement() ?? CastResult(odu: "Okanran - Ilera", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Good health and success!", title: "")
                            isShowingInterpretationView = true;
                        }
                    Image("kola-nuts")
                        .resizable()
                        .frame(width: 300, height: 300)
                    Button {
                        finalResult = result.randomElement() ?? CastResult(odu: "Okanran - Ilera", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Good health and success!", title: "")
                        isShowingInterpretationView = true;
                    } label: {
                        Text("Cast")
                            .font(Font.custom("JustAnotherHand-Regular", size: 30, relativeTo: .title))
                    }
                    .font(.system(size:32)) // prefered to title
                    .foregroundColor(Color.white) // font color
                    .padding()
                    .background(Color.kiwi)
                    .fontWeight(.bold)
                    .cornerRadius(50)
                    .shadow(radius: 20)
                    }
                
            .foregroundColor(Color.forrest)
            .navigationDestination(isPresented: $isShowingInterpretationView) {
                InterpretationView(castResults: result, result: finalResult).environmentObject(controller)
            }
            .padding()
            .background(Color.limeCream)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CastsListView(cast: result).environment(\.managedObjectContext, controller.container.viewContext).environmentObject(controller)) {
                        Image(systemName: "list.bullet.circle")
                    }
                }
            }
            }
            
            .ignoresSafeArea(.all)
        }.ignoresSafeArea(.all)
            .onAppear {
                if let data = UserDefaults.standard.object(forKey: "cast") as? Data,
                   let castData = try? JSONDecoder().decode([CastResult].self, from: data) {
                    result = castData
                }
            }
    }
}

extension WelcomeView {
    static func loadStaticData() -> [CastResult] {
        return [
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
