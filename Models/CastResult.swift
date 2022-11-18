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
    var title: String
    var odu: String
    var date: Date
    var yesNoBoolean: Bool
    var interpretation: String
    
    init(id: UUID = UUID(), title: String, odu: String, date: Date, yesNoBoolean: Bool, interpretation: String) {
        self.id = id
        self.title = title
        self.odu = odu
        self.date = date
        self.yesNoBoolean = yesNoBoolean
        self.interpretation = interpretation
    }
}

extension CastResult {
    static var data: [CastResult] {
        [CastResult(title: "Test Title", odu: "test odu", date: Date(), yesNoBoolean: false, interpretation: "Test Interpretation"),
        ]
    }
}

extension CastResult {
    struct Data {
        var title: String = ""
        var odu: String = ""
        var date: Date = Date()
        var yesNoBoolean = false
        var interpretation = ""
    }
    
    var data: Data {
        return Data(title: title, odu: odu, date: date, yesNoBoolean: yesNoBoolean, interpretation: interpretation)
    }
}
