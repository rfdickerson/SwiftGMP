import Foundation
import SwiftGmp

typealias Matrix = (GmpInt, GmpInt, GmpInt, GmpInt)

let unit = (GmpInt(1), GmpInt(0), GmpInt(0), GmpInt(1))

func * (lhs: Matrix, rhs: Matrix) -> Matrix {
    return ((lhs.0*rhs.0)+(lhs.1*rhs.2),
            (lhs.0*rhs.1)+(lhs.1*rhs.3),
            (lhs.2*rhs.0)+(lhs.3*rhs.2),
            (lhs.2*rhs.1)+(lhs.3*rhs.3))
}

func generate(_ k: GmpInt) -> Matrix {
    return (k, GmpInt(4)*k+GmpInt(2), GmpInt(0), GmpInt(2)*k+GmpInt(1))
}

func extr(_ m: Matrix, _ x: GmpInt ) -> GmpInt {
    let a = (m.0 * x) + m.1
    let b = (m.2 * x) + m.3
    return a/b
}

func safe(_ z: Matrix, _ n: GmpInt) -> Bool {
    return n != extr(z, GmpInt(4))
}

func prod(_ z: Matrix, _ n: GmpInt) -> Matrix {
    return (GmpInt(10), GmpInt(-10)*n, GmpInt(0), GmpInt(1)) * z
}

func next (_ z: Matrix) -> GmpInt {
    return extr(z, GmpInt(3))
}

func printMatrix(_ z: Matrix) {
    let p = "[\(z.0.intValue)\t\(z.1.intValue)]\n[\(z.2.intValue)\t\(z.3.intValue)]"
    print(p)
}

func computePi(withDigits digits: GmpInt) {

    var z = unit
    var n = GmpInt(1)
    var k = GmpInt(1)
    
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
