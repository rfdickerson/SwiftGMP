import Foundation
import SwiftGMP

typealias Matrix = (BigInt, BigInt, BigInt, BigInt)

let unit = (BigInt(1), BigInt(0), BigInt(0), BigInt(1))

func * (lhs: Matrix, rhs: Matrix) -> Matrix {
    return ((lhs.0*rhs.0)+(lhs.1*rhs.2),
            (lhs.0*rhs.1)+(lhs.1*rhs.3),
            (lhs.2*rhs.0)+(lhs.3*rhs.2),
            (lhs.2*rhs.1)+(lhs.3*rhs.3))
}

func generate(_ k: BigInt) -> Matrix {
    return (k, BigInt(4)*k+BigInt(2), BigInt(0), BigInt(2)*k+BigInt(1))
}

func extr(_ m: Matrix, _ x: BigInt ) -> BigInt {
    let a = (m.0 * x) + m.1
    let b = (m.2 * x) + m.3
    return a/b
}

func safe(_ z: Matrix, _ n: BigInt) -> Bool {
    return n == extr(z, BigInt(4))
}

func prod(_ z: Matrix, _ n: BigInt) -> Matrix {
    return (BigInt(10), BigInt(-10)*n, BigInt(0), BigInt(1)) * z
}

func next (_ z: Matrix) -> BigInt {
    return extr(z, BigInt(3))
}

func printMatrix(_ z: Matrix) {
    let p = "[\(z.0.intValue)\t\(z.1.intValue)]\n[\(z.2.intValue)\t\(z.3.intValue)]"
    print(p)
}

func computePi(withDigits digits: BigInt) {

    var z = unit
    var n = BigInt(1)
    var k = BigInt(1)
    
    while n <= digits {
        
        let y = next( z )
        printMatrix(z)
        
        if safe(z, y) {
            
            print (y.intValue)
            
            z = prod(z, y)
            n += 1
            
        } else {
            
            let x = generate(k)
            k += 1
            z = z * x
            
        }
      
    }
}

computePi(withDigits: BigInt(7))

