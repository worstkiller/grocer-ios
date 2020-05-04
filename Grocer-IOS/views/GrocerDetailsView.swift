//
//  GrocerDetailsView.swift
//  Grocer-IOS
//
//  Created by Vikas on 01/05/20.
//

import SwiftUI
import URLImage

/**
 Grocery item details view, opens after the click on single grocery product
 */
struct GrocerDetailsView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var grocerItemModel: GroceryItemModel
    @State var quantity: Int? = 1
    @State var favImg: String? = "heart_line"
    
    var body: some View {
        
        VStack {
            
            Rectangle()
                .edgesIgnoringSafeArea(.top)
                .foregroundColor(Color.fromHex(grocerItemModel.accentColor))
                .frame(height: 0)
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    ToolbarView(hasNavigation: true)
                    
                    URLImage(URL(string: grocerItemModel.image)!,
                             placeholder: { _ in
                                Image("kiwi")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: self.getWidth() ,height: 280, alignment: .center)
                    }){ proxy in
                        proxy
                            .image
                            .resizable()
                            .scaledToFit()
                            .frame(width: self.getWidth() ,height: 280, alignment: .center)
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    ZStack {
                        
                        Rectangle()
                            .cornerRadius(20,
                                          corners: [.topLeft, .topRight])
                            .frame(width: getWidth())
                            .foregroundColor(Color.white)
                        
                        VStack {
                            
                            Text(grocerItemModel.title)
                                .font(.title)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .padding([.top, .leading])
                                .frame(width: self.getWidth(), alignment: .leading)
                                .foregroundColor(Color.fromHex(Constants.COLOR_BLACK))
                            
                            Text(grocerItemModel.quantityDesc ?? "")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .padding([.top, .leading])
                                .frame(width: self.getWidth(), alignment: .leading) .foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN))
                            
                            Text(grocerItemModel.description ?? Constants.LOREUM_TEXT)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)
                                .padding([.top, .leading, .trailing])
                                .frame(width: self.getWidth(), alignment: .leading) .foregroundColor(Color.fromHex(Constants.COLOR_GREY_600))
                            
                            HStack {
                                
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
                                
                                Spacer()
                                
                                Text(Utils.getFormattedPrice(price: grocerItemModel.price))
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                                    .padding(.trailing)
                                    .foregroundColor(Color.fromHex(Constants.COLOR_BLACK))
                                
                            }.frame(width: getWidth(), alignment: .leading)
                                .padding(.leading)
                            
                            HStack (alignment: .center) {
                                
                                Image("delivery")
                                    .resizable()
                                    .frame(width: 24, height: 24, alignment: .leading)
                                    .scaledToFit().padding(.leading)
                                    .foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN))
                                
                                Text(grocerItemModel.delivery ?? "")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                                    .padding(.trailing)
                                    .foregroundColor(Color.fromHex(Constants.COLOR_GREY_600))
                                
                                Spacer()
                                
                                
                                Text(grocerItemModel.discount ?? "")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                                    .padding([.leading, .trailing])
                                    .foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN))
                                
                            }.frame(width: getWidth(), alignment: .leading)
                                .padding(.leading)
                            
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            
                            HStack {
                                
                                Button(action: {
                                    if self.favImg == "heart_line" {
                                        self.favImg = "heart_filled"
                                    }else{
                                        self.favImg = "heart_line"
                                    }
                                }) {
                                    Image(favImg!)
                                        .resizable()
                                        .renderingMode(.original)
                                        .frame(width: 28, height: 28, alignment: .center)
                                        .padding(.all, 14)
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke().foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN)))
                                        .padding(.all, 10)
                                        .accentColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN))
                                }
                                
                                Button(action: {
                                    Utils.showToast(msg: "Added to Bag")
                                }) {
                                    HStack(alignment: .center) {
                                        
                                        Spacer()
                                        
                                        Image("handle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height:  26)
                                            .foregroundColor(Color.white)
                                        
                                        Text("Bag it")
                                            .foregroundColor(Color.white)
                                            .fontWeight(.semibold)
                                            .font(.system(size: 22))
                                        
                                        Spacer()
                                        
                                    }.padding()
                                    
                                }.background(RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN)))
                                    .padding(.trailing)
                                
                            }.frame(width: getWidth(), alignment: .leading)
                                .padding([.leading], 12.0)
                            
                            Spacer()
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }.background(Color.fromHex(self.grocerItemModel.accentColor))
            .padding(.top, -10)
    }
    
    func getWidth()-> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    func getHeight()-> CGFloat {
        return UIScreen.main.bounds.height
    }
}

struct GrocerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GrocerDetailsView(grocerItemModel: LocalDataHandler.productsData[2])
    }
}
