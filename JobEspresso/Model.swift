//
//  Model.swift
//  JobEspresso
//
//  Created by 謝飛飛 on 2020/4/5.
//  Copyright © 2020 MarkFly. All rights reserved.
//

import Foundation

// MARK: - Pharmacies
struct Pharmacies: Codable {
    let type: String?
    let features: [Feature]?
}

// MARK: - Feature
struct Feature: Codable {
    let properties: Properties?
}

// MARK: - Properties
struct Properties: Codable
{
    let county: String?
    let maskAdult: Int?
    
    enum CodingKeys: String, CodingKey {
        case maskAdult = "mask_adult"
        case county
    }
}
