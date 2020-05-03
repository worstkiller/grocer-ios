//
//  ContentView.swift
//  Grocer-IOS
//
//  Created by Vikas on 19/04/20.
//

import SwiftUI

/**
 Home Screen View containing the toolbar view, search view, tablayout view and grocery list view
 */
struct ContentView: View {
    
    @State var categoriesData : [CategoryItemModel] = LocalDataHandler.categoriesData
    @State var productsData : [GroceryItemModel] = LocalDataHandler.productsData
    @ObservedObject var categoryObservable = CategoryObservable()

    var body: some View {
        
        NavigationView {
           
            VStack() {
               
                ToolbarView(hasNavigation: false)
                
                SearchView()
                
                TabLayoutView(categoryItemModel: categoriesData,
                              categoryObservable: categoryObservable,
                              onTabChangeListener: self)
                
                GroceryItemsView(groceryItemModels: productsData)
                
                Spacer()
            
            }.navigationBarTitle("").navigationBarHidden(true)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK:- Tab change listener
extension ContentView : TabChangeDelegate {
    func onTabChange(id: String) {
        self.categoryObservable.selectedId = id
        productsData = LocalDataHandler.getProductsData(category: id)
        print("on tab change listener called, data size = \(productsData.count)")
    }
}
