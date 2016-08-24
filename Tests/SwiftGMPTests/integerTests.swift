import XCTest
@testable import SwiftGMP

class integerTests: XCTestCase {
    
    func testMultiply() {
        let a = BigInt(6)
        let b = BigInt(7)
        
        let c = a * b
        
        let i = c.intValue
        
        XCTAssertEqual(i, 42)
        
    }
    
    func testAdd() {
        let a = BigInt(6)
        let b = BigInt(7)
        
        let c = a + b
        
        let i = c.intValue
        
        XCTAssertEqual(i, 13)
    }
    
    func testAddMult() {
        let a = BigInt(6)
        let b = BigInt(7)
        let c = BigInt(3)
        
        let d = a * b + c
        
        let i = d.intValue
        
        XCTAssertEqual(i, 45)
    }
    
    func testDivide() {
        
        let a = BigInt(36)
        let b = BigInt(5)
        
        let c = a/b
        
        let i = c.intValue
        
        XCTAssertEqual(i, 7)
        
    }
    
    
    func testIncrement() {
        var a = BigInt(6)
        a += 1
        
        XCTAssertEqual(a.intValue, 7)
    }
    
    func testEqual() {
        let a = BigInt(36)
        let b = BigInt(36)
        let c = BigInt(5)
        
        XCTAssertEqual(a, b)
        XCTAssertNotEqual(a, c)
    }
    
    func testLessThanEqual() {
        
        let a = BigInt(36)
        let b = BigInt(5)
        let c = BigInt(36)
        
        XCTAssertLessThan(b, a)
        XCTAssertLessThanOrEqual(a, c)
        
    }
    
    func testNegative() {
        let a = BigInt(-10)
        let b = BigInt(5)
        
        let c = a*b
        XCTAssertEqual(c.intValue, -50)
    }

    static var allTests : [(String, (integerTests) -> () throws -> Void)] {
        return [
            ("testMultiply", testMultiply),
            ("testAdd", testAdd),
            ("testEqual", testEqual)
        ]
    }
}
