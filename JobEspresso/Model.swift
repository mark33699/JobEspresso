//
//  Model.swift
//  JobEspresso
//
//  Created by 謝飛飛 on 2020/4/5.
//  Copyright © 2020 MarkFly. All rights reserved.
//

import Foundation

typealias Pharmacy = PharmaciesResponse.Feature.Pharmacy

struct PharmaciesResponse: Codable
{
    let features: [Feature]?

    struct Feature: Codable
    {
        let pharmacies: Pharmacy?
        
        enum CodingKeys: String, CodingKey {
            case pharmacies = "properties"
        }

        struct Pharmacy: Codable
        {
            let county: String?
            let maskAdult: Int?
            
            enum CodingKeys: String, CodingKey {
                case maskAdult = "mask_adult"
                case county
            }
        }
    }
}

