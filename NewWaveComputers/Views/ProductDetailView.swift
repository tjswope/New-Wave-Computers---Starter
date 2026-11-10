//
//  ProductDetailView.swift
//  New Wave Computers
//
//  PART 1 - Simple values with @State.
//  quantity and isFavorite belong to THIS view only. Nobody else needs them.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    var cart: Cart

    // TODO 1: These two values need to change while the app runs.
    //         Change each one to  @State private var ...  so SwiftUI
    //         watches them and redraws this view when they change.
    var quantity = 1
    var isFavorite = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ProductImage(product: product, size: 240)
                    .frame(maxWidth: .infinity)

                HStack {
                    Text(product.name)
                        .font(.largeTitle.bold())
                    Spacer()
                    Button {
                        // TODO 2: Toggle isFavorite. (Hint: isFavorite.toggle())
                    } label: {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .font(.title)
                            .foregroundStyle(Color.waveCoral)
                    }
                }

                Text(product.tagline)
                    .font(.title3)
                    .foregroundStyle(.secondary)

                Text(product.details)

                Text(product.priceText)
                    .font(.title2.bold())
                    .foregroundStyle(Color.waveBlue)

                HStack {
                    Text("Quantity: \(quantity)")
                        .font(.headline)
                    Spacer()
                    Button {
                        // TODO 1b: Subtract 1 from quantity, but never go below 1.
                    } label: {
                        Image(systemName: "minus.circle.fill")
                    }
                    Button {
                        // TODO 1c: Add 1 to quantity.
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
                .font(.title)
                .foregroundStyle(Color.waveBlue)

                Button {
                    cart.add(product, quantity: quantity)
                } label: {
                    Text("Add \(quantity) to Cart")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.waveBlue, in: RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ProductDetailView(product: .newPhone, cart: Cart())
    }
}
