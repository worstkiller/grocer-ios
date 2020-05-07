//
//  Repository.swift
//  Grocer-IOS
//
//  Created by Vikas on 08/05/20.
//

import Foundation
import Alamofire

/**
 Web api services related repository to manage all the api
 */
struct Repository {
    
    //base url
    let API_ENDPOINT = "https://github.com/worstkiller/grocer-ios/"
    
    //get all categories
    func getCategories(delegate : CategoriesDelegate){
        let finalEndpoint  = "\(API_ENDPOINT)\(PATHS.CATEGORIES.rawValue)".toURL()
        AF.request(finalEndpoint, method: .get).responseDecodable(of: [CategoryItemModel].self){ response in
            guard let responseData = response.value else{
                delegate.onErrorCategories()
                return
            }
            delegate.onSuccess(categories: responseData)
            debugPrint(response)
        }
    }
    
    //get all products for given category id
    func getProducts(categoryId: String, delegate : GroceryProductsDelegate){
        let finalEndpoint  = "\(API_ENDPOINT)\(PATHS.PRODUCTS.rawValue)\(categoryId)".toURL()
        AF.request(finalEndpoint, method: .get).responseDecodable(of: [GroceryItemModel].self){ response in
            guard let responseData = response.value else{
                delegate.onErrorProducts()
                return
            }
            delegate.onSuccess(products: responseData)
            debugPrint(response)
        }
    }
    
}

/**
 api endpoints
 */
fileprivate enum PATHS : String{
    case CATEGORIES = "raw/master/Grocer-IOS/resources/categories"
    case PRODUCTS = "raw/master/Grocer-IOS/resources/"
}

/**
 extension function for the final conversion of the api
 */
fileprivate extension String {
    func toURL()-> String{
        return "\(self).json"
    }
}

/**
 An interface for the categories api
 */
protocol CategoriesDelegate {
    func onSuccess(categories: [CategoryItemModel])
    func onErrorCategories()
}

/**
 An interface for the grocery products
 */
protocol GroceryProductsDelegate {
    func onSuccess(products: [GroceryItemModel])
    func onErrorProducts()
}
