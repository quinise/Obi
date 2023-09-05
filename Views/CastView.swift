//
//  CastView.swift
//
// This view shows the user the details of a cast that they selected from the cast list in the CastListView
//
//  Created by Devin Ercolano on 12/3/22.
//

import SwiftUI

struct CastView: View {
    var cast: Cast
    @Environment(\.managedObjectContext) var managedObjectContext

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
        
    var body: some View {
        ZStack {
            Color.limeCream
                .ignoresSafeArea(.all, edges: .all)
                VStack(spacing: 12) {
                    Text(cast.title ?? "")
                        .font(.custom("Sriracha-Regular", size: 25, relativeTo: .title))
                    Text((cast.yesNoMaybe ?? "")).font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                        .padding()
                    Divider().frame(width: 200)
                        .overlay(Color.forrest)
                    HStack {
                    Text("Odu: ").font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                        Text(cast.odu ?? "").font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                    }
                    HStack {
                        Text("Cast Date ").bold()
                            .padding(.trailing, 23)
                            .font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                        Text(dateFormatter.string(from: cast.timestamp ?? Date()))
                            .font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                    }
                    .padding()
                    Divider().frame(width: 200)
                        .overlay(Color.forrest)
                    Text("Interpretation").bold()
                        .font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                    Text(cast.interpretation ?? "")
                        .font(.custom("Sriracha-Regular", size: 15, relativeTo: .title))
                HStack {
                    Image(cast.maleObi1 ?? "")
                        .resizable()
                        .scaledToFit()
                    Image(cast.maleObi2 ?? "")
                        .resizable()
                        .scaledToFit()
                    Image(cast.femaleObi1 ?? "")
                        .resizable()
                        .scaledToFit()
                    Image(cast.femaleObi2 ?? "")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        .foregroundColor(Color.forrest)
        .ignoresSafeArea(.all)
    }
}

//struct CastView_Previews: PreviewProvider {
//    static var previews: some View {
//        CastView(cast: CastResult(odu: "Akita-Etawa", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Up", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Down", interpretation: "Hard work is rewarded", title: ""))
//    }
//}
