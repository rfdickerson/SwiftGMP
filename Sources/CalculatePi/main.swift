/**
 Copyright IBM Corporation 2016
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 http://www.apache.org/licenses/LICENSE-2.0
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */
 
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

func generate(_ k: Int) -> Matrix {
    return (BigInt(k), BigInt(4)*BigInt(k)+BigInt(2), BigInt(0), BigInt(2)*BigInt(k)+BigInt(1))
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

func computePi(withDigits digits: Int) {

    var z = unit
    var n = 0
    var k = 1
    var j = 0
    
    var buffer = [Int](repeating: 0, count: 10)
    
    while n < digits {
        
        let y = next( z )
        
        if safe(z, y) {
            
            buffer[j] = y.intValue
            j += 1
            
            z = prod(z, y)
            n += 1
            
            if j > 9 {
                printOutput(buffer, n)
                j = 0
            }
            
            
        } else {
            
            let x = generate(k)
            k += 1
            z = z * x
            
        }
      
    }
    
    if n%10 != 0 {
        printOutput(buffer, n)
    }
}

func printOutput(_ buffer: [Int], _ n: Int) {
    var output = ""
    var count = 0
    
    for num in buffer {
        
        if n%10==0 || count < n%10 {
            output += "\(num)"
        } else {
            output += " "
        }
        
        count += 1
    }
    
    output += "\t:\(n)"
    
    print(output)
}

computePi(withDigits: 27)

