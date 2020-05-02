//
//  ToolbarView.swift
//  Grocer-IOS
//
//  Created by Vikas on 25/04/20.
//

import SwiftUI

struct ToolbarView: View {
    
    let iconSizeSearch : CGFloat = 24
    @State var hasNavigation : Bool
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        HStack {
            Button(action: {
                self.mode.animation().wrappedValue.dismiss()
            }) {
                Image(hasNavigation ? "back" : "filter")
                    .resizable()
                    .scaledToFit()
                    .isFilter(hasNavigation)
            }.buttonStyle(PlainButtonStyle())
            
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
        Group{
            ToolbarView(hasNavigation: true)
            ToolbarView(hasNavigation: false)
        }.previewLayout(.fixed(width: 300, height: 56))
        
    }
}

extension View {
    
    //to make the icon size different for the filter icon
    func isFilter(_ hasNavigation: Bool)-> some View {
        if hasNavigation {
            return frame(width: 24, height: 22, alignment:.leading)
        }else{
            return frame(width: 24, height: 17, alignment:.leading)
        }
    }
    
}
