//
//  RemoteImageURL.swift
//  Grocer-IOS
//
//  Created by Vikas on 29/04/20.
//

import Foundation
import SwiftUI

//load remote image
class RemoteImageURL:  ObservableObject {
    @Published var data = Data()
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
