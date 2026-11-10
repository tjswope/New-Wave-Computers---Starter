//
//  CartView.swift
//  New Wave Computers
//
//  Shows the SAME Cart object that the Shop and Build tabs add to.
//

import SwiftUI

struct CartView: View {
    var cart: Cart

    var body: some View {
        NavigationStack {
            Group {
                if cart.items.isEmpty {
                    ContentUnavailableView("Your cart is empty",
                                           systemImage: "cart",
                                           description: Text("Add an NW-PC, a newPhone, a hard drive, or some duck tape!"))
                } else {
                    List {
                        ForEach(cart.items) { item in
                            HStack(spacing: 12) {
                                ProductImage(product: item.product, size: 50)
                                VStack(alignment: .leading) {
                                    Text(item.product.name)
                                        .font(.headline)
                                    Text("Qty: \(item.quantity)")
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Text(item.lineTotal.formatted(.currency(code: "USD")))
                            }
                        }
                        .onDelete { offsets in
                            cart.remove(at: offsets)
                        }

                        Section {
                            HStack {
                                Text("Total")
                                    .font(.headline)
                                Spacer()
                                Text(cart.total.formatted(.currency(code: "USD")))
                                    .font(.headline)
                                    .foregroundStyle(Color.waveBlue)
                            }
                            Button("Check Out") {
                                cart.checkOut()
                            }
                            .bold()
                        }
                    }
                }
            }
            .navigationTitle("Cart")
        }
    }
}

#Preview {
    let cart = Cart()
    cart.add(.newPhone, quantity: 2)
    cart.add(.duckTape)
    return CartView(cart: cart)
}
