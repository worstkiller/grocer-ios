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
    
    @State var categoryItemModel  : [CategoryItemModel]
    @State var isSelected: Bool
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: isSelected) {
            HStack {
                //contents
                ForEach(categoryItemModel) { result in
                    TabLayoutRow(categoriesItemModel: result,
                                 isSelected: result.isDefault,
                                 onTabChangeDelegate: self)
                }
            }
            .padding(.top)
        }
    }
    
    //resets the default flag to false
    func resetTabs() {
        for var item in categoryItemModel {
            item.isDefault = false
        }
    }
    
    //returns the isDefault category id
    func getDefaultTabId(id: String){
        for var result in categoryItemModel {
            if result.id == id {
                result.isDefault = true
            }
        }
    }
}

struct TabLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        TabLayoutView(categoryItemModel: LocalDataHandler.categoriesData, isSelected: false)
    }
}

extension TabLayoutView : TabChangeDelegate {
    func onTabChange(id: String) {
        resetTabs()
        getDefaultTabId(id: id)
        self.isSelected.toggle()
        print("on tab change layout called")
    }
}
