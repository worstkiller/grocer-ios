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
    var body: some View {
        VStack {
            
            Rectangle()
                .edgesIgnoringSafeArea(.top)
                .foregroundColor(Color.fromHex("#c1d49f"))
                .frame(height: 0)
            
            ToolbarView(hasNavigation: true)
            
            URLImage(URL(string: "https://google.com")!,
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
            
            ZStack {
                
                Rectangle()
                    .cornerRadius(20,
                                  corners: [.topLeft, .topRight])
                    .frame(width: getWidth())
                    .foregroundColor(Color.white)
                
                VStack {
                    
                    Text("Avacado Medium")
                        .font(.title)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .padding([.top, .leading])
                        .frame(width: self.getWidth(), alignment: .leading)
                        .foregroundColor(Color.fromHex(Constants.COLOR_BLACK))
                    
                    Text("Per PC 50g approx.")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .padding([.top, .leading])
                        .frame(width: self.getWidth(), alignment: .leading) .foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN))
                    
                    Text(Constants.LOREUM_TEXT)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding([.top, .leading, .trailing])
                        .frame(width: self.getWidth(), alignment: .leading) .foregroundColor(Color.fromHex(Constants.COLOR_GREY_600))
                    
                    HStack {
                        
                        
                        Image("plus")
                            .resizable()
                            .frame(width: 14, height: 14, alignment: .center)
                            .padding(.all, 12)
                            .clipShape(Circle())
                            .overlay(Circle().stroke())
                            .padding(.all, 10)
                            .foregroundColor(Color.fromHex(Constants.COLOR_GREY_600))
                        
                        Text("01")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .padding([.leading, .trailing], 8.0)
                            .foregroundColor(Color.fromHex(Constants.COLOR_BLACK))
                        
                        Image("minus")
                            .resizable()
                            .frame(width: 14, height: 14, alignment: .center)
                            .padding(.all, 12)
                            .clipShape(Circle())
                            .overlay(Circle().stroke())
                            .padding(.all, 10)
                            .foregroundColor(Color.fromHex(Constants.COLOR_GREY_600))
                        
                        Spacer()
                        
                        Text(Utils.getFormattedPrice(price: 120))
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
                        
                        Text("Standard: Friday Evening")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .padding(.trailing)
                            .foregroundColor(Color.fromHex(Constants.COLOR_GREY_600))
                        
                        Spacer()
                        
                        
                        Text("You save: 20%")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .padding([.leading, .trailing])
                            .foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN))
                        
                    }.frame(width: getWidth(), alignment: .leading)
                        .padding(.leading)
                    
                    Spacer()
                    Spacer()
                    
                    HStack {
                        
                        Image("heart_line")
                            .resizable()
                            .frame(width: 28, height: 28, alignment: .center)
                            .padding(.all, 14)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke().foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN)))
                            .padding(.all, 10)
                            .accentColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN))
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
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
                            
                        }.background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN)))
                            .padding(.trailing)
                        
                    }.frame(width: getWidth(), alignment: .leading)
                        .padding([.leading], 12.0)
                    
                }
                
            }
        }
        .background(Color.fromHex("#c1d49f"))
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
        GrocerDetailsView()
    }
}
