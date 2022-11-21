//
//  EditView.swift
//  Obi
//
//  Created by Devin Ercolano on 11/19/22.
//

import SwiftUI

enum ActiveAlertEdit {
    case first, second, third, fourth
}

struct EditView: View {
    @State private var editTitle = ""
    @State private var badCredentialAlert = false
    @State private var activeAlert: ActiveAlertEdit = .first
    
    var result: CastResult
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView()
//    }
//}
