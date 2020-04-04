//
//  PharmaciesViewModel.swift
//  JobEspresso
//
//  Created by 謝飛飛 on 2020/4/5.
//  Copyright © 2020 MarkFly. All rights reserved.
//

import Foundation

class PharmaciesViewModel
{
    var pharmaciesResult: Dictionary<String,Int> = [:]
    var countrys: Array<String> = []
    var completionHandler: (() -> Void) = {}

    func fetchPharmacies()
    {
        ApiManager.apiRequest(with: "https://raw.githubusercontent.com/kiang/pharmacies/master/json/points.json",
                              objectType: PharmaciesResponse.self)
        { (result) in
            
            switch result
            {
            case .success(let response):
                if let features = response.features
                {
                    self.sumMaskByCountry(features: features)
                }
            case .failure(let error):
                DispatchQueue.main.async
                {
                    self.completionHandler()
                }
                print(error.localizedDescription)
            }
        }
    }

    func sumMaskByCountry(features: [PharmaciesResponse.Feature])
    {
        for currentFeature in features
        {
            guard let country = currentFeature.pharmacies?.county,
                  let numberOfMask = currentFeature.pharmacies?.maskAdult else { break }
            
            if pharmaciesResult[country] == nil
            {
                pharmaciesResult[country] = numberOfMask
            }
            else
            {
                pharmaciesResult[country]! += numberOfMask
            }
        }
        
        countrys = Array(pharmaciesResult.keys)

        DispatchQueue.main.async
        {
            self.completionHandler()
        }
    }
}
