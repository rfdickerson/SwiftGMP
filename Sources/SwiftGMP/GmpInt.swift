import Foundation
import CGMP

class GmpInt {
    
    var i = mpz_t()
    
    init(_ value: Int = 0) {
        
        __gmpz_init(&i)
        __gmpz_set_si(&i, value )
        
    }
    
    
    init(withPointer pointer: UnsafeMutablePointer<mpz_t>) {
        self.i = pointer.pointee
    }
    
    deinit {
        __gmpz_clear(&i)
    }
    
    var intValue: Int {
        
        let ret = __gmpz_get_si(&self.i)
        return ret
        
    }
    
}

extension GmpInt: Equatable {}

extension GmpInt: Comparable {}

func * (lhs: GmpInt, rhs: GmpInt) -> GmpInt {
    let ret = GmpInt()
    __gmpz_mul(&ret.i, &lhs.i, &rhs.i)
    return ret
}

func * (lhs: Int, rhs: GmpInt) -> GmpInt {
    let ret = GmpInt()
    let tmp = GmpInt(lhs)
    __gmpz_mul(&ret.i, &tmp.i, &rhs.i)
    return ret
}

func + (lhs: GmpInt, rhs: GmpInt) -> GmpInt {
    let ret = GmpInt()
    __gmpz_add(&ret.i, &lhs.i, &rhs.i)
    return ret
}

func += (lhs: inout GmpInt, rhs: GmpInt) {
    __gmpz_add(&lhs.i, &lhs.i, &rhs.i)
}

func += (lhs: inout GmpInt, rhs: Int) {
    let tmp = GmpInt(rhs)
    __gmpz_add(&lhs.i, &lhs.i, &tmp.i)
}

func *= (lhs: inout GmpInt, rhs: GmpInt) {
    __gmpz_mul(&lhs.i, &lhs.i, &rhs.i)
}

func == (lhs: GmpInt, rhs: GmpInt) -> Bool {
    return (0 == __gmpz_cmp(&lhs.i, &rhs.i))
}


func != (lhs: GmpInt, rhs: GmpInt) -> Bool {
    return !(lhs == rhs)
}

func / (lhs: GmpInt, rhs: GmpInt) -> GmpInt {
    let ret = GmpInt(0)
    __gmpz_fdiv_q(&ret.i,&lhs.i,&rhs.i)
    return ret
}

func /= (lhs: GmpInt, rhs: GmpInt) {
    __gmpz_fdiv_q(&lhs.i, &lhs.i, &rhs.i)
}

func <(lhs: GmpInt, rhs: GmpInt) -> Bool {
    return (__gmpz_cmp(&lhs.i, &rhs.i) < 0)
}
