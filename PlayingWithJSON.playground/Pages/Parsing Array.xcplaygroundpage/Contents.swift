//: [Previous](@previous)

import Foundation

let json = """
[
    {
        "title": "New York",
        "location_type": "City",
        "woeid": 2459115,
        "latt_long": "40.71455,-74.007118"
    }
]
""".data(using: .utf8)!

struct City: Codable {
    let title: String
    let locationType: String
    let woeid: Int
    let coordinate: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case locationType = "location_type"
        case woeid
        case coordinate = "latt_long"
    }
}

do {
    let weatherArray = try JSONDecoder().decode([City].self, from: json)
    let weather = weatherArray
    dump(weather)
} catch {
    print("decoding error: \(error)")
}
