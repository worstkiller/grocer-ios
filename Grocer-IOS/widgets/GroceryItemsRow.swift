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
    let cellWidth = UIScreen.main.bounds.width/2 - 20
    let cellHeight : CGFloat =  (UIScreen.main.bounds.width/2 - 32) * 1.75
    var isPromotional = false
    let rupee = "\u{20B9}"+"\(90)"
    
    var body: some View {
        VStack {
            if isPromotional {
                getPromotionalView(cellWidth: cellWidth, cellHeight: cellHeight)
            } else {
                getProductItemView(cellWidth: cellWidth, cellHeight: cellHeight)
            }
        }
    }
    
    /**
     get product item view for grocery view
     */
    func getProductItemView(cellWidth: CGFloat, cellHeight: CGFloat)-> some View{
        return ZStack {
            RoundedRectangle(cornerRadius: 30).frame(width: cellWidth, height: cellHeight, alignment: .center).foregroundColor(Utils.getColor("#f5e0bb"))
            
            VStack {
                HStack{
                    Spacer()
                    Image("plus")
                        .resizable()
                        .frame(width: 10, height: 10, alignment: .center)
                        .padding(.all, 10)
                        .background(Rectangle()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(Color.white)
                            .opacity(0.6))
                        .clipShape(Circle())
                        .padding(.all, 10)
                        .opacity(0.7)
                    
                }.frame(width: cellWidth, height: 40, alignment: .center)
                Spacer()
            }
            
            VStack {
                
                Image("kiwi")
                    .resizable()
                    .scaledToFit()
                    .frame(width: cellWidth, height: 130, alignment: .center)
                    .padding(.top)
                
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
                            .font(.system(size: 10))
                            .foregroundColor(Color.gray)
                        
                    }.padding(.leading)
                    
                    Spacer()
                    
                    Text("View Prices")
                        .font(.system(size: 10))
                        .multilineTextAlignment(.trailing)
                        .lineLimit(1)
                        .foregroundColor(Color.gray)
                        .padding(.trailing)
                    
                }.padding(.top)
                
                Spacer()
                
            }.frame(width: cellWidth, height: cellHeight, alignment: .center)
        }
    }
    
    /**
     returns a promotional view for grocery view
     */
    func getPromotionalView(cellWidth: CGFloat, cellHeight: CGFloat) -> some View {
        return  ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: cellWidth, height: cellHeight, alignment: .center)
                .foregroundColor(Utils.getColor("#efefef"))
            
            Image("fruit")
                .resizable()
                .scaledToFill()
                .frame(width: cellWidth, height: cellHeight, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            
            VStack(spacing: 16){
                
                Spacer()
                
                Text("40 % OFF")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding()
                
                Text("Foodly Surprise")
                    .font(.caption)
                    .fontWeight(.bold)
                    .backgroundCoupon(cellWidth: cellWidth, cellHeight: cellHeight)
                    .foregroundColor(Color.green)
                
                
                Text("Use the above code \nforspring festival collection")
                    .lineLimit(2)
                    .font(.system(size: 10))
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
        }
    }
}

//MARK:- Extension functions for views
extension View {
    
    //coupon background
    func backgroundCoupon(cellWidth: CGFloat, cellHeight: CGFloat) -> some View {
        self.background(RoundedRectangle(cornerRadius: 5)
            .foregroundColor(Color.white).opacity(0.8)
            .frame(width: cellWidth - 42, height: 30, alignment: .center))
            .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.green, lineWidth: 2)
                .frame(width: cellWidth - 42, height: 30, alignment: .center))
    }
    
}

struct GroceryItemsRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            GroceryItemsRow()
            GroceryItemsRow(isPromotional: true)
        }.previewLayout(.fixed(width: 300, height: 270))
    }
}
