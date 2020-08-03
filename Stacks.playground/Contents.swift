import UIKit

let validBrackets = "[{<>}]"
let validCharacterSet = CharacterSet(charactersIn: validBrackets).inverted
print(validBrackets)
dump(validCharacterSet)

