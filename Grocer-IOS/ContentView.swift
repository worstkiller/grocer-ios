//
//  ContentView.swift
//  Grocer-IOS
//
//  Created by Vikas on 19/04/20.
//

import SwiftUI

/**
 Home Screen View
 */
struct ContentView: View {
    var body: some View {
        VStack() {
            ToolbarView()
            SearchView()
            TabLayoutView().padding(.top)
            GroceryItemsView()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
