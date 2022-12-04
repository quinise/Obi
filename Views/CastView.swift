//
//  CastView.swift
//  Obi
//
//  Created by Devin Ercolano on 12/3/22.
//

import SwiftUI

struct CastView: View {
    @State var cast: CastResult
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    @State private var orientation = UIDeviceOrientation.unknown
      
    @ViewBuilder var subView : some View {
        NavigationView {
            ZStack {
                Color.limeCream
                    .ignoresSafeArea()
                    VStack(spacing: 12) {
                        Text((cast.yesNoMaybe ??  "")).font(.title)
                            .padding()
                        Divider().frame(width: 200)
                        HStack {
                        Text("Odu: ")
                        Text(cast.odu)
                        }
                        HStack {
                            Text("Cast Date ").bold()
                                .padding(.trailing, 23)
                            Text(dateFormatter.string(from: cast.timestamp))
                        }
                        .padding()
                        Divider().frame(width: 200)
                        Text("Interpretation").bold()
                        Text(cast.interpretation)
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
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .shadow(radius: 20)
                }
            .padding() // ToDo change to custom green color
            .navigationBarTitle(cast.title, displayMode: .inline)
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
    }
}

//struct CastView_Previews: PreviewProvider {
//    static var previews: some View {
//        CastView(cast: CastResult(odu: "Akita-Etawa", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Up", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Down", interpretation: "Hard work is rewarded", title: ""))
//    }
//}
