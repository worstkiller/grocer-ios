//
//  CategoryItemModel.swift
//  Grocer-IOS
//
//  Created by Vikas on 29/04/20.
//

import Foundation

//data model to hold the categories information
struct CategoryItemModel: Hashable, Codable, Identifiable {
    var id: String
    var title: String
    var isDefault: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "uid"
        case title
        case isDefault = "default"
    }
}
