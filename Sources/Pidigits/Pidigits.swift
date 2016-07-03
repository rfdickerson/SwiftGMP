import Foundation

typealias Matrix = (Int, Int, Int, Int)

func extr(_ m: Matrix, _ x: Int ) -> Double {
    let a = Double(m.0) * Double(x) + Double(m.1)
    let b = Double(m.2) * Double(x) + Double(m.3)
    return a/b
}

let unit = (1, 0, 0, 1)

func * (lhs: Matrix, rhs: Matrix) -> Matrix {
    return (lhs.0*rhs.0+lhs.1*rhs.2,
            lhs.0*rhs.1+lhs.1*rhs.3,
            lhs.2*rhs.0+lhs.3*rhs.2,
            lhs.2*rhs.1+lhs.3*rhs.3)
    
}

func generate(_ k: Int) -> Matrix {
    return (k, 4*k+2, 0, 2*k+1)
}

func safe(_ z: Matrix, _ n: Int) -> Bool {
    return n == Int(floor(extr(z, 4)))
}

func prod(_ z: Matrix, _ n: Int) -> Matrix {
    return (10, -10*n, 0, 1) * z
}

func next (_ z: Matrix) -> Int {
    return Int(floor(extr(z, 3)))
}

func computePi(withDigits digits: Int) {

    var z = unit
    var n = 1
    var k = 1
    
    while n <= digits {
        
        let y = next( z )
        
        if safe(z, y) {
            
            print (y)
            z = prod(z, y)
            n+=1
            
        } else {
            
            let x = generate(k)
            k += 1
            z = z * x
            
        }
      
    }
}
