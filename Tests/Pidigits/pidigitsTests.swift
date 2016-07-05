import XCTest
@testable import Pidigits

class pidigitsTests: XCTestCase {
    
    func testComputePi() {
        
        self.measure() {
            computePi(withDigits: GmpInt(25))
        }
        
    }
    
    func testMultiply() {
        let a = GmpInt(6)
        let b = GmpInt(7)
        
        let c = a * b
        
        let i = c.intValue
        
        XCTAssertEqual(i, 42)
        
    }
    
    func testAdd() {
        let a = GmpInt(6)
        let b = GmpInt(7)
        
        let c = a + b
        
        let i = c.intValue
        
        XCTAssertEqual(i, 13)
    }
    
    func testAddMult() {
        let a = GmpInt(6)
        let b = GmpInt(7)
        let c = GmpInt(3)
        
        let d = a * b + c
        
        let i = d.intValue
        
        XCTAssertEqual(i, 45)
    }
    
    func testDivide() {
        
        let a = GmpInt(36)
        let b = GmpInt(5)
        
        let c = a/b
        
        let i = c.intValue
        
        XCTAssertEqual(i, 7)
        
    }
    
    
    func testIncrement() {
        var a = GmpInt(6)
        a += 1
        
        XCTAssertEqual(a.intValue, 7)
    }
    
    func testEqual() {
        let a = GmpInt(36)
        let b = GmpInt(36)
        let c = GmpInt(5)
        
        XCTAssertEqual(a, b)
        XCTAssertNotEqual(a, c)
    }
    
    func testLessThanEqual() {
        
        let a = GmpInt(36)
        let b = GmpInt(5)
        let c = GmpInt(36)
        
        XCTAssertLessThan(b, a)
        XCTAssertLessThanOrEqual(a, c)
        
    }
    
    func testNegative() {
        let a = GmpInt(-10)
        let b = GmpInt(5)
        
        let c = a*b
        XCTAssertEqual(c.intValue, -50)
    }

    static var allTests : [(String, (pidigitsTests) -> () throws -> Void)] {
        return [
            ("testComputePi", testComputePi),
        ]
    }
}
