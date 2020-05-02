//
//  Protocols.swift
//  Grocer-IOS
//
//  Created by Vikas on 02/05/20.
//

import Foundation

//1. categories change deleget
protocol TabChangeDelegate {
    func onTabChange(id: String)
}

//2. search delegate
protocol SearchChangeDelegate {
    func onKeyChange(text: String)
}
