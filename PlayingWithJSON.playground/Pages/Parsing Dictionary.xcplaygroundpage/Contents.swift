import Foundation

// Parsing Dictionary
let json = """
{
 "results": [
   {
     "firstName": "John",
     "lastName": "Appleseed"
   },
  {
    "firstName": "Alex",
    "lastName": "Paul"
  }
 ]
}
""".data(using: .utf8)!

struct ResultsWrapper: Codable {
    let results: [Contact]
}

struct Contact: Codable {
    let firstName: String
    let lastName: String
}

// Decoding the JSON

do {
    let dictionary = try JSONDecoder().decode(ResultsWrapper.self, from: json)
    let contacts = dictionary.results
    dump(contacts)
} catch {
    print("decoding error: \(error)")
}
