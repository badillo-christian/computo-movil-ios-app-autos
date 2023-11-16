//
//  Product.swift
//  ProductList
//
//  Created by Christian Badillo on 11.11.2023.
//

import Foundation

// MARK: - Item

struct Item: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let marca, nombre, anio, precio, km, motor, garantia: String
    let thumbnail: String
    let images: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, marca
        case nombre = "nombre"
        case anio, precio, km, motor, garantia, thumbnail, images
    }
}
