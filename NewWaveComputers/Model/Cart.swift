//
//  Cart.swift
//  New Wave Computers
//
//  PART 4 - Sharing ONE @Observable object with many views.
//  The app makes ONE Cart and hands that same object to every view.
//  When one view changes the cart, every view that reads it updates.
//

import Foundation
import Observation

/// One line in the cart: a product and how many of it.
/// CartItem is a STRUCT (value type).
struct CartItem: Identifiable {
    let id = UUID()
    var product: Product
    var quantity: Int

    var lineTotal: Double {
        product.price * Double(quantity)
    }
}

// TODO 7: Make Cart observable, just like RewardsCard in TODO 5.
//   Add the @Observable macro on the line above "class Cart".
//   Until you do this, the Cart tab badge and the bar at the
//   bottom of the Shop tab will never update.
class Cart {
    var items: [CartItem] = []

    /// The total number of things in the cart (2 newPhones + 1 tape = 3).
    var itemCount: Int {
        // TODO 8a: Add up the quantity of every item and return it.
        return 0
    }

    /// The total price of everything in the cart.
    var total: Double {
        // TODO 8b: Add up the lineTotal of every item and return it.
        return 0.0
    }

    /// Adds a product to the cart. If it is already in the cart,
    /// increase that item's quantity instead of adding a second line.
    func add(_ product: Product, quantity: Int = 1) {
        // TODO 8c:
        //   - If an item with the same product name is already in items,
        //     increase its quantity.
        //   - Otherwise append a new CartItem(product:quantity:).
        // HINT: CartItem is a struct (a value type). "for item in items"
        //       gives you COPIES. Loop over items.indices instead so you
        //       can change items[index] directly.
    }

    func remove(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func checkOut() {
        items.removeAll()
    }
}
