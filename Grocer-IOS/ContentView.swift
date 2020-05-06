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
    @ObservedObject var productsObservable = ProductObservable(LocalDataHandler.productsData)
    
    var body: some View {
        
        NavigationView {
            
            VStack() {
                
                ToolbarView(hasNavigation: false)
                
                SearchView(searchDelegate: self)
                
                TabLayoutView(categoryItemModel: categoriesData,
                              categoryObservable: categoryObservable,
                              onTabChangeListener: self)
                
                GroceryItemsView(groceryItemModels: productsObservable.productsList ?? [])
                
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
        productsObservable.productsList = LocalDataHandler.getProductsData(category: id)
        print("on tab change listener called, data size = \(productsData.count)")
    }
}

extension ContentView: SearchChangeDelegate {
    func onKeyChange(text: String) {
        let filteredList = productsObservable.productsList?.filter{ $0.title.contains(text)} ?? []
        productsObservable.productsList = filteredList.count>0 ? filteredList : LocalDataHandler.getProductsData(category: categoryObservable.selectedId ?? LocalDataHandler.categoriesData[0].id)
        print("text change listener called")
    }
}
