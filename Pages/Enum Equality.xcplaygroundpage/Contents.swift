//: Playground - noun: a place where people can play

import Foundation

enum FooBar: Equatable {
    enum Bar {
        case barA
        case barB
    }
    case FooA(String)
    case FooB(String, Bar)
    case FooC(Int)
}

func ==(lhs: FooBar, rhs: FooBar) -> Bool {
    var l = lhs
    var r = rhs
    let l1 = withUnsafeBytes(of: &l) { (s) in
        return s.map({$0})
    }
    let r1 = withUnsafeBytes(of: &r) { (s) in
        return s.map({$0})
    }
    return l1 == r1
}

print("Begin")

// Trues
assert(FooBar.FooA("A") == FooBar.FooA("A"))
assert(FooBar.FooB("A", .barA) == FooBar.FooB("A", .barA))
assert(FooBar.FooB("A", .barB) == FooBar.FooB("A", .barB))
assert(FooBar.FooA("AaaaaaaaaaaaAaaaaaaaaaaa") == FooBar.FooA("AaaaaaaaaaaaAaaaaaaaaaaa"))
assert(FooBar.FooC(0) == FooBar.FooC(0))

// Falses
assert(FooBar.FooC(1) != FooBar.FooC(0))
assert(FooBar.FooB("A", .barA) != FooBar.FooB("A", .barB))
assert(FooBar.FooA("A") != FooBar.FooA("a"))
assert(FooBar.FooA("1") != FooBar.FooC(1))

print("Done")


