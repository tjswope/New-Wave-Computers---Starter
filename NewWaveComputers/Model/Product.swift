//
//  Product.swift
//  New Wave Computers
//
//  A Product is a STRUCT, so it is a VALUE type.
//  Every time you assign a Product to a new variable, Swift makes a copy.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    var name: String
    var tagline: String
    var details: String
    var price: Double
    var imageName: String     // the picture's name in Assets.xcassets
    var symbolName: String    // SF Symbol shown until the picture is added

    var priceText: String {
        price.formatted(.currency(code: "USD"))
    }
}

// Everything New Wave Computers sells.
extension Product {
    static let nwPC = Product(
        name: "NW-PC",
        tagline: "Ride the wave of computing.",
        details: "Our flagship desktop. 16 GB of memory, a 1 TB drive, and a case shaped like a breaking wave.",
        price: 999.99,
        imageName: "nw-pc",
        symbolName: "desktopcomputer")

    static let newPhone = Product(
        name: "newPhone",
        tagline: "The phone that's always new.",
        details: "A 6.1\" display, all-day battery, and a camera that can photograph a wave from a mile away.",
        price: 799.00,
        imageName: "newphone",
        symbolName: "iphone")

    static let hardDrive = Product(
        name: "Wave Drive 2 TB",
        tagline: "Room for every file you'll ever make.",
        details: "A portable 2 TB hard drive. Plug it into your NW-PC and never delete a photo again.",
        price: 89.99,
        imageName: "hard-drive",
        symbolName: "externaldrive")

    static let duckTape = Product(
        name: "New Wave Duck Tape",
        tagline: "Fixes everything. Even your newPhone case.",
        details: "Sixty yards of ocean-blue duck tape. Officially recommended by our repair department.",
        price: 6.49,
        imageName: "duck-tape",
        symbolName: "bandage")

    static let catalog: [Product] = [nwPC, newPhone, hardDrive, duckTape]
}
