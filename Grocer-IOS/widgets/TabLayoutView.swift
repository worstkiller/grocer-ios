//
//  TabLayoutView.swift
//  Grocer-IOS
//
//  Created by Vikas on 25/04/20.
//

import SwiftUI

/**
 View to act as tab view and help in selecting the various categories
 */
struct TabLayoutView: View {
    var body: some View {
        
        ScrollView (.horizontal, showsIndicators: false) {
             HStack {
                 //contents
                TabLayoutRow(categoryTitle: "Fruits", isSelected: true)
                TabLayoutRow(categoryTitle: "Vegetables", isSelected: false)
                TabLayoutRow(categoryTitle: "Nuts & Seeds", isSelected: false)
                TabLayoutRow(categoryTitle: "Dairy", isSelected: false)
             }
        }

    }
}

struct TabLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        TabLayoutView()
    }
}
