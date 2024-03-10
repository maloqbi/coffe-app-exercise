//
//  CoffeModel.swift
//  coffe-app
//
//  Created by Mohammed on 29/08/1445 AH.
//


import Foundation
import UIKit

struct Coffee: Identifiable, Decodable {
    let id: Int
    let title: String?
    let description: String?
    let ingredients: [String]
    let image: String?
}

extension Coffee {
    var uiImage: UIImage? {
        nil
    }
}
