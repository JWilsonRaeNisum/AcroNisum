//
//  AcronymResponse.swift
//  AcroNisum
//
//  Created by Joaquin Wilson on 15-03-21.
//

import Foundation

struct VariationObjects: Codable {
    var lf: String
    var freq: Int
    var since: Int
}

struct LongFormObject: Codable {
    var lf: String
    var freq: Int
    var since: Int
    var variationObjects: [VariationObjects]

    enum CodingKeys: String, CodingKey {
        case variationObjects = "vars"
        case lf
        case freq
        case since
    }
}

struct AcronymResponse: Codable {
    var sf: String
    var lfs: [LongFormObject]
}
