//
//  CityObject.swift
//  Cities
//
//  Created by Ronald Kimutai on 16/07/2018.
//  Copyright © 2018 Ronald Kimutai. All rights reserved.
//

import Foundation

typealias CitiesObject = [CityObject]

struct CityObject: Codable {
    let country, name: String
    let id: Int
    let coord: Coord

    enum CodingKeys: String, CodingKey {
        case country, name
        case id = "_id"
        case coord
    }
}

struct Coord: Codable {
    let lon, lat: Double
}

// MARK: Convenience initializers
extension CityObject {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(CityObject.self, from: data) else { return nil }
        self = me
    }
}

extension Coord {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Coord.self, from: data) else { return nil }
        self = me
    }
}

extension Array where Element == CitiesObject.Element {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(CitiesObject.self, from: data) else { return nil }
        self = me
    }
}
