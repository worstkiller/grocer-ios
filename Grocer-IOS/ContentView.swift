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
    
    var repo: Repository
    
    @State var isLoading: Bool = true
    
    @ObservedObject var categoryObservable = CategoryObservable()
    @ObservedObject var productsObservable = ProductObservable()
    @ObservedObject var selectedCategory = CategorySelectedObservable()
    @ObservedObject var progressObservable = ProgressObservable()
    
    init() {
        repo = Repository()
        //loading categories on start on the view
        repo.getCategories(delegate: self)
    }
    
    var body: some View {
        
        VStack {
            
            if progressObservable.isLoading {
               
                ProgressIndicatorView()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN))
           
            } else {
                NavigationView {
                    
                    VStack() {
                        
                        ToolbarView(hasNavigation: false)
                        
                        SearchView(searchDelegate: self)
                        
                        TabLayoutView(categoryItemModel: categoryObservable.categoryList,
                                      categoryObservable: selectedCategory,
                                      onTabChangeListener: self)
                        
                        GroceryItemsView(groceryItemModels: productsObservable.productsList)
                        
                        Spacer()
                        
                    }.navigationBarTitle("").navigationBarHidden(true)
                }
            }
        }
        
    }
    
    
    //get default category id or return first one
    func getDefaultCategory()-> String?{
        if categoryObservable.categoryList.count>0 {
            for item in categoryObservable.categoryList {
                if item.isDefault {
                    return item.id
                }
            }
        }
        
        //else return 0 position category
        return nil
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
        self.progressObservable.isLoading.toggle()
        self.selectedCategory.selectedId = id
        productsObservable.productsList = LocalDataHandler.getProductsData(category: id)
        self.repo.getProducts(categoryId: id, delegate: self)
        print("on tab change listener called, data size = \(String(describing: productsObservable.productsList.count))")
    }
}

//MARK:- search key listener
extension ContentView: SearchChangeDelegate {
    func onKeyChange(text: String) {
        let filteredList = productsObservable.productsList.filter{ $0.title.contains(text)}
        productsObservable.productsList = filteredList.count>0 ? filteredList : LocalDataHandler.getProductsData(category: selectedCategory.selectedId ?? LocalDataHandler.categoriesData[0].id)
        print("text change listener called")
    }
}

//MARK:- categories api response
extension ContentView: CategoriesDelegate {
    func onSuccess(categories: [CategoryItemModel]) {
        DispatchQueue.main.async {
            self.categoryObservable.categoryList = categories
            //loading products after successful categories fetch
            self.repo.getProducts(categoryId: self.getDefaultCategory() ?? "", delegate: self)
        }
    }
    
    func onErrorCategories() {
        DispatchQueue.main.async {
            Utils.showToast(msg: "Sorry, something went wrong!")
            print("received error while loading categories")
        }
    }
}

//MARK:- products api response
extension ContentView: GroceryProductsDelegate {
    func onSuccess(products: [GroceryItemModel]) {
        DispatchQueue.main.async {
            self.productsObservable.productsList = products
            self.progressObservable.isLoading.toggle()
        }
    }
    
    func onErrorProducts() {
        DispatchQueue.main.async {
            Utils.showToast(msg: "Sorry, something went wrong!")
            print("received error while loading products")
        }
    }
}
