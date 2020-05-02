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
    
    @State var categoriesData : [CategoryItemModel] = LocalDataHandler.categoriesData
    @State var productsData : [GroceryItemModel] = LocalDataHandler.productsData
    
    var body: some View {
        NavigationView {
            VStack() {
                ToolbarView(hasNavigation: false)
                SearchView()
                TabLayoutView(categoryItemModel: categoriesData, isSelected: false)
                GroceryItemsView(groceryItemModels: productsData)
                Spacer()
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
