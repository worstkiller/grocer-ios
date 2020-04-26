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
    var cellWidth = UIScreen.main.bounds.width/2 - 20
    let cellHeight : CGFloat =  (UIScreen.main.bounds.width/2 - 32) * 1.75
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
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                            .lineLimit(2)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.leading)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 50))
                        
                        HStack {
                            
                            VStack {
                                Text(rupee).font(.headline)
                                Text("Per Kg")
                                    .font(.system(size: 10)).foregroundColor(Color.gray)
                                
                            }.padding(.leading)
                            
                            Spacer()
                            
                            Text("View Prices")
                                .font(.system(size: 10))
                                .multilineTextAlignment(.trailing).lineLimit(1)
                                .foregroundColor(Color.gray).padding(.trailing)
                            
                        }.padding(.top)
                        
                        Spacer()
                        
                        
                    }.frame(width: cellWidth, height: cellHeight, alignment: .center)
                
                    Image("plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20, alignment: .center)
                    
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
