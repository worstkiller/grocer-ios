//
//  TabLayoutRow.swift
//  Grocer-IOS
//
//  Created by Vikas on 25/04/20.
//

import SwiftUI

/**
 Single row view for the tab layout view
 */
struct TabLayoutRow: View {
    
    var categoriesItemModel: CategoryItemModel
    var selectedId: String?
    
    var onTabChangeDelegate : TabChangeDelegate?
    
    var body: some View {
        
        Button(action: {
            self.onTabChangeDelegate?.onTabChange(id: self.categoriesItemModel.id)
        }) {
            VStack {
                Text(categoriesItemModel.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(self.isSelectedTab() ? Color.fromHex(Constants.COLOR_BLACK) : Color.fromHex(Constants.COLOR_GREY_400))
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 100, height: 4, alignment: .center)
                    .foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN))
                    .opacity(self.isSelectedTab()  ? 1.0 : 0)
            }
        }
    }
    
    func isSelectedTab() -> Bool{
        //for first time when user did not selected the tab
        guard  let notEmptyId = selectedId else {
            return categoriesItemModel.isDefault
        }
        
        //if not empty then check for the selected id
        return notEmptyId == categoriesItemModel.id
    }
}

struct TabLayoutRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabLayoutRow(categoriesItemModel: LocalDataHandler.categoriesData[0])
            TabLayoutRow(categoriesItemModel: LocalDataHandler.categoriesData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
