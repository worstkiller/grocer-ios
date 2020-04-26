//
//  GroceryItemsView.swift
//  Grocer-IOS
//
//  Created by Vikas on 25/04/20.
//

import SwiftUI

/**
 Grocery item view
 */
struct GroceryItemsView: View {
    let screenWidth = UIScreen.main.bounds.width/2 - 32
    var body: some View {
        GridStack(minCellWidth: screenWidth, spacing: 10, numItems: 4, alignment: .center) { index, cellWidth in
            GroceryItemsRow(isPromotional: index == 1 ? true : false)
        }.background(Rectangle().foregroundColor(Utils.getColor("#fafafa")))
    }
}

struct GroceryItemsView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryItemsView()
    }
}
