//
//  SearchResult.swift
//  Home
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation

struct SearchResult: Decodable {
    let id: Int
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let url: String
}
