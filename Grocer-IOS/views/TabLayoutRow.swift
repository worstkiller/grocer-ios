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
    
    var categoryTitle : String
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Text(categoryTitle)
                .font(.headline)
                .multilineTextAlignment(.center).foregroundColor(isSelected ? Color.fromHex(Constants.COLOR_BLACK) : Color.fromHex(Constants.COLOR_GREY_400))
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 4, alignment: .center)
                .foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN))
                .opacity(isSelected ? 1.0 : 0)
        }
        
    }
}

struct TabLayoutRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabLayoutRow(categoryTitle: "Fruits", isSelected: true)
            TabLayoutRow(categoryTitle: "Vegetables", isSelected: false)
        }.previewLayout(.fixed(width: 300, height: 70))
    }
    
}
