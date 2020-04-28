//
//  LocalDataHandler.swift
//  Grocer-IOS
//
//  Created by Vikas on 29/04/20.
//

import Foundation
import UIKit
import SwiftUI

// local data handler class for loading the data from project json resource files
struct LocalDataHandler {
    
    //category array
    static let categoriesData : [CategoryItemModel] = load("categories.json")
    
    //category array, returning a static default product array for intial loading
    static let productsData : [GroceryItemModel] = load("5756773e-87d8-11ea-bc55-0242ac130003.json")
    
    private static func load<K: Decodable>(_ fileName: String) -> K {
        
        let data: Data
        
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Couldn't find \(fileName) in main bundle.")
        }
        
        do{
            data = try Data(contentsOf: fileUrl)
            let decoder = JSONDecoder()
            return try decoder.decode(K.self, from: data)
        }catch {
            fatalError("Couldn't find \(fileName) in main bundle.")
        }
        
    }
    
    static func getProductsData(category: String) -> [GroceryItemModel] {
        return load("\(category).json")
    }
}
