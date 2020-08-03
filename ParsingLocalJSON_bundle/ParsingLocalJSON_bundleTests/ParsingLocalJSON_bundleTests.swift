//
//  ParsingLocalJSON_bundleTests.swift
//  ParsingLocalJSON_bundleTests
//
//  Created by Gregory Keeley on 8/3/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import XCTest
@testable import ParsingLocalJSON_bundle

class ParsingLocalJSON_bundleTests: XCTestCase {
    
    func testPresidentModel() {
        let json = """
[{
        "number": 1,
        "president": "George Washington",
        "birth_year": 1732,
        "death_year": 1799,
        "took_office": "1789-04-30",
        "left_office": "1797-03-04",
        "party": "No Party"
    },
    {
        "number": 2,
        "president": "John Adams",
        "birth_year": 1735,
        "death_year": 1826,
        "took_office": "1797-03-04",
        "left_office": "1801-03-04",
        "party": "Federalist"
    }
]
""".data(using: .utf8)!
        let expectedFirstPresident = "George Washington"
        do {
            let presidents = try JSONDecoder().decode([President].self, from: json)
            XCTAssertEqual(expectedFirstPresident, presidents[0].name)
        } catch {
            XCTFail("Decoding error: \(error)")
        }
    }
    func testParseJSONFromBundle() {
        // arrange
        let bundle = Bundle.main
        let filename = "presidents"
        let firstBlackPresident = "Barack Obama"
        
        // act
        do {
            let presidents = try bundle.parseJSON(with: filename)
            XCTAssertEqual(firstBlackPresident, presidents[43].name)
        } catch {
            XCTFail("decoding error: \(error)")
        }
        // assert
    }
}
