//
//  PrayerTests.swift
//  MuslimData_Tests
//
//  Created by Kosrat D. Ahmad on 10/8/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import MuslimData

class PrayerTests: XCTestCase {

    var attributes: PrayerAttribute!
    var date: Date!
    var offsets: [Double]!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        date = Date(timeIntervalSince1970: 1538956800) // 2018/10/08
        offsets = [1,1,1,-1,-1,-1]
        attributes = PrayerAttribute(method: .makkah, asrMethod: .shafii, adjustAngle: .angleBased, offsets: offsets)
    }

    override func tearDown() {
        date = nil
        attributes = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFixedPrayer() {
        // Test fixed prayer times for Sulav, Iraq
        let sulav = Location(latitude: 0.0, longitude: 0.0, city: "Sulav", countryCode: "IQ",
                             countryName: "Iraq", hasFixedPrayerTimes: true)
        PrayerTime.getPrayerTimes(location: sulav, date: date, attributes: attributes) { prayer, error in
            XCTAssertNil(error)
            XCTAssertNotNil(prayer)
            let stringPrayer = prayer!.formatPrayers(.time24)
            XCTAssertEqual(stringPrayer[0], "04:46")
            XCTAssertEqual(stringPrayer[1], "06:11")
            XCTAssertEqual(stringPrayer[2], "11:59")
            XCTAssertEqual(stringPrayer[3], "15:13")
            XCTAssertEqual(stringPrayer[4], "17:43")
            XCTAssertEqual(stringPrayer[5], "18:58")
        }

        // Test fixed prayer times for Erbil, Iraq
        let erbil = Location(latitude: 0.0, longitude: 0.0, city: "Erbil", countryCode: "IQ",
                             countryName: "Iraq", hasFixedPrayerTimes: true)
        PrayerTime.getPrayerTimes(location: erbil, date: date, attributes: attributes) { prayer, error in
            XCTAssertNil(error)
            XCTAssertNotNil(prayer)
            let stringPrayer = prayer!.formatPrayers(.time24)
            XCTAssertEqual(stringPrayer[0], "04:42")
            XCTAssertEqual(stringPrayer[1], "06:10")
            XCTAssertEqual(stringPrayer[2], "12:02")
            XCTAssertEqual(stringPrayer[3], "15:10")
            XCTAssertEqual(stringPrayer[4], "17:41")
            XCTAssertEqual(stringPrayer[5], "18:56")
        }

        // Test fixed prayer times for Baghdad, Iraq
        let baghdad = Location(latitude: 0.0, longitude: 0.0, city: "Baghdad", countryCode: "IQ",
                             countryName: "Iraq", hasFixedPrayerTimes: true)
        PrayerTime.getPrayerTimes(location: baghdad, date: date, attributes: attributes) { prayer, error in
            XCTAssertNil(error)
            XCTAssertNotNil(prayer)
            let stringPrayer = prayer!.formatPrayers(.time24)
            XCTAssertEqual(stringPrayer[0], "04:34")
            XCTAssertEqual(stringPrayer[1], "06:03")
            XCTAssertEqual(stringPrayer[2], "11:58")
            XCTAssertEqual(stringPrayer[3], "15:14")
            XCTAssertEqual(stringPrayer[4], "17:40")
            XCTAssertEqual(stringPrayer[5], "18:58")
        }

        // Test fixed prayer times for Sanandaj, Iran
        let sanandaj = Location(latitude: 0.0, longitude: 0.0, city: "Sanandaj", countryCode: "IR",
                             countryName: "Iran", hasFixedPrayerTimes: true)
        PrayerTime.getPrayerTimes(location: sanandaj, date: date, attributes: attributes) { prayer, error in
            XCTAssertNil(error)
            XCTAssertNotNil(prayer)
            let stringPrayer = prayer!.formatPrayers(.time24)
            XCTAssertEqual(stringPrayer[0], "05:04")
            XCTAssertEqual(stringPrayer[1], "06:23")
            XCTAssertEqual(stringPrayer[2], "12:29")
            XCTAssertEqual(stringPrayer[3], "15:27")
            XCTAssertEqual(stringPrayer[4], "18:04")
            XCTAssertEqual(stringPrayer[5], "19:19")
        }
    }

    func testCalculatedPrayer() {
        // Test calculated prayer times for Mecca, Saudi Arabia
        let mecca = Location(latitude: 21.42664, longitude: 39.82563, city: "Mecca", countryCode: "SA",
                             countryName: "Saudi Arabia", hasFixedPrayerTimes: false)
        PrayerTime.getPrayerTimes(location: mecca, date: date, attributes: attributes) { prayer, error in
            XCTAssertNil(error)
            XCTAssertNotNil(prayer)
            let stringPrayer = prayer!.formatPrayers(.time24)
            XCTAssertEqual(stringPrayer[0], "04:59")
            XCTAssertEqual(stringPrayer[1], "06:15")
            XCTAssertEqual(stringPrayer[2], "12:09")
            XCTAssertEqual(stringPrayer[3], "15:30")
            XCTAssertEqual(stringPrayer[4], "18:01")
            XCTAssertEqual(stringPrayer[5], "19:31")
        }
    }
}
