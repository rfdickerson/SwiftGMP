import XCTest
@testable import Pidigits

class pidigitsTests: XCTestCase {
    
    func testExample() {
        
        computePi(withDigits: 15)
        
    }

    static var allTests : [(String, (pidigitsTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
