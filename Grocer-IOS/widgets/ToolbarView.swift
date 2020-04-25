//
//  ToolbarView.swift
//  Grocer-IOS
//
//  Created by Vikas on 25/04/20.
//

import SwiftUI

struct ToolbarView: View {
    let iconSizeSearch : CGFloat = 30
    var body: some View {
        HStack {
            Image("filter")
                .resizable()
                .frame(width: 30, height: 23, alignment:.leading)
                .scaledToFit()
            Spacer()
            Image("cart")
                .resizable()
                .frame(width: iconSizeSearch, height: iconSizeSearch,alignment:.trailing)
            .scaledToFit()
            
        }.padding(16)
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
