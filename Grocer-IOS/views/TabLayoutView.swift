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
    @ObservedObject var categoryObservable : CategoryObservable
    var onTabChangeListener: TabChangeDelegate?
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                //contents
                ForEach(categoryItemModel) { result in
                    TabLayoutRow(categoriesItemModel: result,
                                 selectedId: self.categoryObservable.selectedId,
                                 onTabChangeDelegate: self.onTabChangeListener)
                }
            }.padding(.top)
        }
    }
}

struct TabLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        TabLayoutView(categoryItemModel: LocalDataHandler.categoriesData,
                      categoryObservable: CategoryObservable())
    }
}
