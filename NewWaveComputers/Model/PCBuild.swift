//
//  PCBuild.swift
//  New Wave Computers
//
//  The options a customer picks when building a custom NW-PC.
//  PCBuild is a STRUCT (a value type). BuildPCView keeps one in @State.
//

import Foundation

struct PCBuild {
    var memoryGB = 16
    var storageTB = 1
    var hasDuckTapeWrap = false

    /// $999.99 base, +$100 for every extra 16 GB of memory,
    /// +$80 for every extra TB of storage, +$6.49 for the duck tape wrap.
    var price: Double {
        var total = 999.99
        total += Double((memoryGB - 16) / 16) * 100
        total += Double(storageTB - 1) * 80
        if hasDuckTapeWrap {
            total += 6.49
        }
        return total
    }

    /// Turns this build into a Product so it can go in the cart.
    var asProduct: Product {
        Product(name: "Custom NW-PC (\(memoryGB) GB, \(storageTB) TB\(hasDuckTapeWrap ? ", taped" : ""))",
                tagline: "Built by you.",
                details: "A custom NW-PC.",
                price: price,
                imageName: "nw-pc",
                symbolName: "desktopcomputer")
    }
}
