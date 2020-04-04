//
//  PharmaciesViewModelTests.swift
//  JobEspressoTests
//
//  Created by 謝飛飛 on 2020/4/5.
//  Copyright © 2020 MarkFly. All rights reserved.
//

import XCTest

class PharmaciesViewModelTests: XCTestCase
{
    var sut: PharmaciesViewModel!

    override func setUp()
    {
        super.setUp()
        sut = PharmaciesViewModel()
    }
    
    func testSumMaskByCountry_whenThreePharmacies_shouldOneCountry()
    {
        let features = [PharmaciesResponse.Feature(pharmacies: Pharmacy(county: "Taipei", maskAdult: 10)),
                        PharmaciesResponse.Feature(pharmacies: Pharmacy(county: "Taipei", maskAdult: 20)),
                        PharmaciesResponse.Feature(pharmacies: Pharmacy(county: "Taipei", maskAdult: 30))]
        sut.sumMaskByCountry(features: features)
        XCTAssertEqual(sut.pharmaciesResult["Taipei"], 60)
    }
    
    func testSumMaskByCountry_whenThreePharmacies_shouldTwoCountry()
    {
        let features = [PharmaciesResponse.Feature(pharmacies: Pharmacy(county: "Taipei", maskAdult: 10)),
                        PharmaciesResponse.Feature(pharmacies: Pharmacy(county: "Tainan", maskAdult: 20)),
                        PharmaciesResponse.Feature(pharmacies: Pharmacy(county: "Taipei", maskAdult: 30))]
        sut.sumMaskByCountry(features: features)
        XCTAssertEqual(sut.pharmaciesResult["Taipei"], 40)
        XCTAssertEqual(sut.pharmaciesResult["Tainan"], 20)
    }
    
    func testSumMaskByCountry_whenThreePharmacies_shouldThreeCountry()
    {
        let features = [PharmaciesResponse.Feature(pharmacies: Pharmacy(county: "Taipei", maskAdult: 10)),
                        PharmaciesResponse.Feature(pharmacies: Pharmacy(county: "Tainan", maskAdult: 20)),
                        PharmaciesResponse.Feature(pharmacies: Pharmacy(county: "Taichung", maskAdult: 30))]
        sut.sumMaskByCountry(features: features)
        XCTAssertEqual(sut.pharmaciesResult["Taipei"], 10)
        XCTAssertEqual(sut.pharmaciesResult["Tainan"], 20)
        XCTAssertEqual(sut.pharmaciesResult["Taichung"], 30)
    }

    override func tearDown()
    {
        sut = nil
        super.tearDown()
    }
}
