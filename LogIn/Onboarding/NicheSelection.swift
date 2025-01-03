//
//  NicheSelection.swift
//  LearningPathwaysFrontendIOS
//
//  Created by Jacob Mobin on 2025-01-03.
//

import SwiftUI

struct NicheSelection: View {
    //Niches
    //IT
    //Law
    var body: some View {
        card(topic: "Information Technology")
        card(topic: "Law")
    }
}

struct card: View {
    let topic: String
    
    var body: some View {
        Text(topic)
    }
}

#Preview {
    NicheSelection()
}
