//
//  Result.swift
//  This file defines a cast that is passed from view to view. It provides an array of possible cast permutations.
//
//  Created by Devin Ercolano on 11/16/22.
//

import Foundation
import SwiftUI

struct CastResult: Identifiable, Codable {
    let id: UUID
    var odu: String
    var timestamp: Date
    var yesNoMaybe: String
    var maleObi1: String
    var maleObi2: String
    var femaleObi1: String
    var femaleObi2: String
    var interpretation: String
    var title: String

    init(id: UUID = UUID(), odu: String, timestamp: Date, yesNoMaybe: String, maleObi1: String, maleObi2: String, femaleObi1: String, femaleObi2: String, interpretation: String, title: String) {
        self.id = id
        self.odu = odu
        self.timestamp = Date()
        self.yesNoMaybe = yesNoMaybe
        self.maleObi1 = maleObi1
        self.maleObi2 = maleObi2
        self.femaleObi1 = femaleObi1
        self.femaleObi2 = femaleObi2
        self.interpretation = interpretation
        self.title = title
    }
}

extension CastResult {
    static var data: [CastResult] {
        [CastResult(odu: "Aalaffia - Ogbe", timestamp: Date(), yesNoMaybe: "Yes", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Up", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Up", interpretation: "Symbolizes good general welfare", title: ""),
         CastResult(odu: "Yeku - Oyeku", timestamp: Date(), yesNoMaybe: "No", maleObi1: "MaleObi1Down", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "No light - potential delays and possible protection from ancestors...", title: ""),
         CastResult(odu: "Okanran - Ilera", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Good health and success!", title: ""),
         CastResult(odu: "Okanran - Ilera", timestamp: Date(), yesNoMaybe: "Maybe", maleObi1: "MaleObi1Down", maleObi2: "MaleObi2Up", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Good health and success!", title: ""),
         CastResult(odu: "Okanran-Aje", timestamp: Date(), yesNoMaybe: "No", maleObi1: "MaleObi1Down", maleObi2: "MaleObi2Up", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Abundance", title: ""),
         CastResult(odu: "Okanran-Aje", timestamp: Date(), yesNoMaybe: "No", maleObi1: "Male.Obi1Up", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Down", interpretation: "Abundance", title: ""),
         CastResult(odu: "Okanran-Aje", timestamp: Date(), yesNoMaybe: "No", maleObi1: "MaleObi1Down", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Up", femaleObi2: "FemaleObi2Down", interpretation: "Abundance", title: ""),
         CastResult(odu: "Okanran-Aje", timestamp: Date(), yesNoMaybe: "No", maleObi1: "MaleObi1Down", maleObi2: "MaleObi2Down", femaleObi1: "FemaleObi1Down", femaleObi2: "FemaleObi2Up", interpretation: "Abundance", title: ""),
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
