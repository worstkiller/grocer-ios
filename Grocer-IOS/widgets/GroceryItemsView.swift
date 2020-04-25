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
    var body: some View {
        GridStack(rows: 30, columns: 2) { row, col in
            Text("Hola")
        }.edgesIgnoringSafeArea(.top)
    }
}

struct GroceryItemsView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryItemsView()
    }
}
