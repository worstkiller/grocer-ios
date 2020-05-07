//
//  AddProductContextMenu.swift
//  Grocer-IOS
//
//  Created by Vikas on 07/05/20.
//

import SwiftUI

/**
 Add product context menu for showing the options when user clicks on the plus button
 */
struct AddProductContextMenu: View {
    
    @State var groceryItemModel: GroceryItemModel
    @State var quantity: Int? = 1
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack{
            
            Color.fromHex(groceryItemModel.accentColor).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Button(action: {
                    self.mode.animation().wrappedValue.dismiss()
                }){
                    Image("plus")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 24, height: 24)
                        .rotationEffect(Angle(degrees: 45))
                }
                
                Button(action: {
                    self.quantity = self.quantity! + 1
                }) {
                    Image("plus")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 12, height: 12, alignment: .center)
                        .padding(.all, 10)
                        .clipShape(Circle())
                        .overlay(Circle().stroke())
                        .padding(.all, 10)
                        .foregroundColor(Color.fromHex(Constants.COLOR_GREY_600))
                }
                
                Text("\(String(format: "%02d", quantity!))")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .padding([.leading, .trailing], 8.0)
                    .foregroundColor(Color.fromHex(Constants.COLOR_BLACK))
                
                Button(action: {
                    if(self.quantity != 0){
                        self.quantity = self.quantity! - 1
                    }
                }) {
                    Image("minus")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 12, height: 12, alignment: .center)
                        .padding(.all, 10)
                        .clipShape(Circle())
                        .overlay(Circle().stroke())
                        .padding(.all, 10)
                        .foregroundColor(Color.fromHex(Constants.COLOR_GREY_600))
                }
                
            }
            
            
        }.frame(width: 200, height: 300)
            .cornerRadius(30)
            .foregroundColor(Color.fromHex(groceryItemModel.accentColor)).padding(.all, 50)
    }
}

struct AddProductContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        AddProductContextMenu(groceryItemModel: LocalDataHandler.productsData[0])
    }
}
