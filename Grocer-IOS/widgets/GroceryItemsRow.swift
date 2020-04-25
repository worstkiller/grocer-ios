//
//  GroceryItemsRow.swift
//  Grocer-IOS
//
//  Created by Vikas on 25/04/20.
//

import SwiftUI

/**
 Single item view to show the grocery product with details like title, price and subtitle etc
 */
struct GroceryItemsRow: View {
    let cellWidth = UIScreen.main.bounds.width/2 - 32
    let cellHeight : CGFloat = 260
    var isPromotional = false
    let rupee = "\u{20B9}"+"\(90)"
    
    var body: some View {
        VStack {
            if isPromotional {
                
                Text("Promotional")
                
            } else {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 30).frame(width: cellWidth, height: cellHeight, alignment: .center).foregroundColor(Utils.getColor("#f5e0bb"))
                    
                    VStack {
                        Image("kiwi").resizable().scaledToFit().frame(width: cellWidth, height: 130, alignment: .center).padding(.top)
                        
                        HStack {
                            Text("Kiwi")
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                                .padding(.leading)
                            
                            Spacer()
                        }
                        
                        Text("Gurugram Mandi Haryana")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .lineLimit(2)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.leading)
                            .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 10))
                        
                        HStack {
                            
                            VStack {
                                Text(rupee).font(.headline)
                                Text("Per Kg").font(.caption) .foregroundColor(Color.gray)
                                
                            }.padding(.leading)
                            
                            Spacer()
                            
                            Text("View Prices")
                                .font(.caption)
                                .multilineTextAlignment(.trailing).lineLimit(1)
                                .foregroundColor(Color.gray).frame(width: 85, height: 15, alignment: .center)
                            
                        }.padding(.top)
                        
                        Spacer()
                        
                        
                    }.frame(width: cellWidth, height: cellHeight, alignment: .center)
                    
                }
                
            }
        }
    }
}

struct GroceryItemsRow_Previews: PreviewProvider {
    static var previews: some View {
        GroceryItemsRow()
    }
}
