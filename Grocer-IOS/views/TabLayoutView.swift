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
    
    var body: some View {
        
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                //contents
                ForEach(categoryItemModel) { result in
                    TabLayoutRow(categoryTitle: result.title,
                                 isSelected: result.isDefault)
                }
            }
        }.padding(.top)
    }
}

struct TabLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        TabLayoutView(categoryItemModel: LocalDataHandler.categoriesData)
    }
}
