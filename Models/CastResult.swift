//
//  Result.swift
//  MyObi
//
//  Created by Devin Ercolano on 11/16/22.
//

import Foundation
import SwiftUI

struct CastResult: Identifiable, Codable {
    let id: UUID
    var odu: String
    var date: Date
    var yesNoMaybe: String
    var maleObi1: Int
    var maleObi2: Int
    var femaleObi1: Int
    var femaleObi2: Int
    var interpretation: String
    
    init(id: UUID = UUID(), odu: String, date: Date, yesNoMaybe: String, maleObi1: Int, maleObi2: Int, femaleObi1: Int, femaleObi2: Int, interpretation: String) {
        self.id = id
        self.odu = odu
        self.date = date
        self.yesNoMaybe = yesNoMaybe
        self.maleObi1 = maleObi1
        self.maleObi2 = maleObi2
        self.femaleObi1 = femaleObi1
        self.femaleObi2 = femaleObi2
        self.interpretation = interpretation
    }
}

extension CastResult {
    static var data: [CastResult] {
        [CastResult(odu: "Aalaffia - Ogbe", date: Date(), yesNoMaybe: "Yes", maleObi1: 1, maleObi2: 1, femaleObi1: 1, femaleObi2: 1, interpretation: "Symbolizes good general welfare"),
         CastResult(odu: "Yeku - Oyeku", date: Date(), yesNoMaybe: "No", maleObi1: 0, maleObi2: 0, femaleObi1: 0, femaleObi2: 0, interpretation: "No light - potential delays and possible protection from ancestors..."),
         CastResult(odu: "Okanran - Ilera", date: Date(), yesNoMaybe: "Maybe", maleObi1: 1, maleObi2: 0, femaleObi1: 0, femaleObi2: 0, interpretation: "Good health and success!"),
         CastResult(odu: "Okanran - Ilera", date: Date(), yesNoMaybe: "Maybe", maleObi1: 0, maleObi2: 1, femaleObi1: 0, femaleObi2: 0, interpretation: "Good health and success!"),
         CastResult(odu: "Okanran-Aje", date: Date(), yesNoMaybe: "No", maleObi1: 0, maleObi2: 1, femaleObi1: 0, femaleObi2: 0, interpretation: "Abundance"),
         CastResult(odu: "Okanran-Aje", date: Date(), yesNoMaybe: "No", maleObi1: 1, maleObi2: 0, femaleObi1: 0, femaleObi2: 0, interpretation: "Abundance"),
         CastResult(odu: "Okanran-Aje", date: Date(), yesNoMaybe: "No", maleObi1: 0, maleObi2: 0, femaleObi1: 1, femaleObi2: 0, interpretation: "Abundance"),
         CastResult(odu: "Okanran-Aje", date: Date(), yesNoMaybe: "No", maleObi1: 0, maleObi2: 0, femaleObi1: 0, femaleObi2: 1, interpretation: "Abundance"),
         CastResult(odu: "Ejife-Ejire", date: Date(), yesNoMaybe: "Yes", maleObi1: 0, maleObi2: 0, femaleObi1: 1, femaleObi2: 1, interpretation: "criminality, arguments"),
         CastResult(odu: "Ejife-Ero", date: Date(), yesNoMaybe: "Maybe", maleObi1: 1, maleObi2: 0, femaleObi1: 1, femaleObi2: 1, interpretation: "calmness and whole-mindedness"),
         CastResult(odu: "Ejife-Ero", date: Date(), yesNoMaybe: "Maybe", maleObi1: 0, maleObi2: 1, femaleObi1: 1, femaleObi2: 1, interpretation: "calmness and whole-mindedness"),
         CastResult(odu: "Obita-Etawa", date: Date(), yesNoMaybe: "Maybe", maleObi1: 0, maleObi2: 1, femaleObi1: 1, femaleObi2: 1, interpretation: "No arguments, living harmoniously"),
         CastResult(odu: "Obita-Etawa", date: Date(), yesNoMaybe: "Maybe", maleObi1: 1, maleObi2: 0, femaleObi1: 1, femaleObi2: 1, interpretation: "No arguments, living harmoniously"),
         CastResult(odu: "Akita-Etawa", date: Date(), yesNoMaybe: "Maybe", maleObi1: 1, maleObi2: 1, femaleObi1: 0, femaleObi2: 1, interpretation: "Hard work is rewarded"),
         CastResult(odu: "Akita-Etawa", date: Date(), yesNoMaybe: "Maybe", maleObi1: 1, maleObi2: 1, femaleObi1: 1, femaleObi2: 0, interpretation: "Hard work is rewarded")
        ]
    }
}

extension CastResult {
    struct Data {
        var title: String = ""
        var odu: String = ""
        var date: Date = Date()
        var yesNoMaybe = ""
        var maleObi1: Int = Int.random(in: 1..<2)
        var maleObi2: Int = Int.random(in: 1..<2)
        var femaleObi1: Int = Int.random(in: 1..<2)
        var femaleObi2: Int = Int.random(in: 1..<2)
        var interpretation = ""
    }
    
    var data: Data {
        return Data(odu: odu, date: date, yesNoMaybe: yesNoMaybe, maleObi1: maleObi1, maleObi2: maleObi2,  femaleObi1: femaleObi1, femaleObi2: femaleObi2, interpretation: interpretation)
    }
}
