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

#if os(Linux)
    import CGMPLinux
#else
    import CGMPDarwin
#endif

public class BigInt {
    
    internal var i = mpz_t()
    
    public init(_ value: Int = 0) {
        
        __gmpz_init(&i)
        __gmpz_set_si(&i, value )
        
    }
    
    
    public init(withPointer pointer: UnsafeMutablePointer<mpz_t>) {
        self.i = pointer.pointee
    }
    
    deinit {
        __gmpz_clear(&i)
    }
    
    public var intValue: Int {
        
        let ret = __gmpz_get_si(&self.i)
        return ret
        
    }
    
}

extension BigInt: Equatable {}

extension BigInt: Comparable {}

public func * (lhs: BigInt, rhs: BigInt) -> BigInt {
    let ret = BigInt()
    __gmpz_mul(&ret.i, &lhs.i, &rhs.i)
    return ret
}

public func * (lhs: Int, rhs: BigInt) -> BigInt {
    let ret = BigInt()
    let tmp = BigInt(lhs)
    __gmpz_mul(&ret.i, &tmp.i, &rhs.i)
    return ret
}

public func + (lhs: BigInt, rhs: BigInt) -> BigInt {
    let ret = BigInt()
    __gmpz_add(&ret.i, &lhs.i, &rhs.i)
    return ret
}

public func += (lhs: inout BigInt, rhs: BigInt) {
    __gmpz_add(&lhs.i, &lhs.i, &rhs.i)
}

public func += (lhs: inout BigInt, rhs: Int) {
    let tmp = BigInt(rhs)
    __gmpz_add(&lhs.i, &lhs.i, &tmp.i)
}

public func *= (lhs: inout BigInt, rhs: BigInt) {
    __gmpz_mul(&lhs.i, &lhs.i, &rhs.i)
}

public func == (lhs: BigInt, rhs: BigInt) -> Bool {
    return (0 == __gmpz_cmp(&lhs.i, &rhs.i))
}

public func != (lhs: BigInt, rhs: BigInt) -> Bool {
    return !(lhs == rhs)
}

public func / (lhs: BigInt, rhs: BigInt) -> BigInt {
    let ret = BigInt(0)
    __gmpz_fdiv_q(&ret.i,&lhs.i,&rhs.i)
    return ret
}

public func /= (lhs: BigInt, rhs: BigInt) {
    __gmpz_fdiv_q(&lhs.i, &lhs.i, &rhs.i)
}

public func <(lhs: BigInt, rhs: BigInt) -> Bool {
    return (__gmpz_cmp(&lhs.i, &rhs.i) < 0)
}
