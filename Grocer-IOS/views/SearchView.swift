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
    @State private var searchText = SearchTextChangeObservable()
    var searchChangeDelegate : SearchChangeDelegate?
    
    init(searchDelegate: SearchChangeDelegate?) {
        self.searchChangeDelegate = searchDelegate
        searchText.searchChangeDelegate = searchDelegate
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.fromHex(Constants.COLOR_GREY_400), lineWidth: 1)
                .frame(width: width, height: 48, alignment: .center)
            
            HStack {
                TextField("Search here", text: $searchText.searchText, onEditingChanged: { active in
                    print("Editing changed: \(active)")
                }, onCommit: {
                    print("Commited: \(self.searchText)")
                    self.searchChangeDelegate?.onKeyChange(text: self.searchText.searchText)
                }).padding()
                Image("search")
                    .resizable()
                    .frame(width:18, height:18)
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
        SearchView(searchDelegate: nil)
    }
}
