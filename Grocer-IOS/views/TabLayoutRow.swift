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
    
    @State var categoriesItemModel: CategoryItemModel
    @State var isSelected: Bool
    
    var onTabChangeDelegate : TabChangeDelegate?
    
    var body: some View {
        
        Button(action: {
            self.isSelected.toggle()
            self.onTabChangeDelegate?.onTabChange(id: self.categoriesItemModel.id)
        }) {
            VStack {
                Text(categoriesItemModel.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(self.isSelected ? Color.fromHex(Constants.COLOR_BLACK) : Color.fromHex(Constants.COLOR_GREY_400))
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 100, height: 4, alignment: .center)
                    .foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN))
                    .opacity(self.isSelected  ? 1.0 : 0)
            }
        }
    }
    
    //returns if the selected and current id is match
    func isTabSelected()-> Bool {
        return categoriesItemModel.isDefault
    }
}

struct TabLayoutRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabLayoutRow(categoriesItemModel: LocalDataHandler.categoriesData[0], isSelected: true)
            TabLayoutRow(categoriesItemModel: LocalDataHandler.categoriesData[1], isSelected: false)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
