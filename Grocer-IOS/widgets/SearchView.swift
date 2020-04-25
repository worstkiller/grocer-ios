//
//  SearchView.swift
//  Grocer-IOS
//
//  Created by Vikas on 25/04/20.
//

import SwiftUI

/**
 search view component for search in the app
 */
struct SearchView: View {
    
    let width = UIScreen.main.bounds.width - 32
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: width, height: 54, alignment: .center)
            
            HStack {
                TextField("Search here", text: $searchText).padding()
                Image("search")
                    .resizable()
                    .frame(width:20, height:20)
                    .scaledToFit()
                Spacer()
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
