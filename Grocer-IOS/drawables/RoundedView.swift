//
//  RoundedView.swift
//  Grocer-IOS
//
//  Created by Vikas on 25/04/20.
//

import SwiftUI

struct RoundedView: View {
     let cellWidth = UIScreen.main.bounds.width/2 - 32
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30).frame(width: cellWidth, height: 250, alignment: .center).foregroundColor(Utils.getColor("#f5e0bb"))
                       
    }
}

struct RoundedView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedView()
    }
}
