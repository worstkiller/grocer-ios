//
//  GroceryItemModel.swift
//  Grocer-IOS
//
//  Created by Vikas on 28/04/20.
//

import Foundation

//data model to hold the product or promo related data
struct GroceryItemModel: Hashable, Codable, Identifiable {
    var id: String
    var image : String
    var title: String
    var subtitle: String
    var price: Int?
    var quantityLabel: String?
    var miscInfo: String
    var accentColor: String
    var parentUid: String
    var type: Category
    var description: String?
    var quantityDesc: String?
    var delivery: String?
    var discount: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "uid"
        case image
        case title
        case subtitle
        case price
        case quantityLabel = "quantity_label"
        case miscInfo =  "misc_info"
        case accentColor = "accent_color"
        case parentUid = "parent_uid"
        case type
        case description
        case quantityDesc = "quantity_desc"
        case delivery
        case discount
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case product = "product"
        case promotion = "promotion"
    }
    
}
