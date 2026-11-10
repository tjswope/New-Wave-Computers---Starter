//
//  ShopView.swift
//  New Wave Computers
//
//  Lists everything New Wave Computers sells. The bar at the bottom reads
//  from the SAME cart object as the Cart tab, so they always agree.
//

import SwiftUI

struct ShopView: View {
    var cart: Cart

    var body: some View {
        NavigationStack {
            List {
                StoreHeader()
                    .listRowBackground(Color.clear)

                Section("Products") {
                    ForEach(Product.catalog) { product in
                        NavigationLink {
                            ProductDetailView(product: product, cart: cart)
                        } label: {
                            ProductRow(product: product)
                        }
                    }
                }
            }
            .navigationTitle("Shop")
            .safeAreaInset(edge: .bottom) {
                CartSummaryBar(cart: cart)
            }
        }
    }
}

struct StoreHeader: View {
    var body: some View {
        HStack(spacing: 16) {
            if UIImage(named: "nw-logo") != nil {
                Image("nw-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            } else {
                Image(systemName: "water.waves")
                    .font(.system(size: 40))
                    .foregroundStyle(Color.waveBlue)
            }
            VStack(alignment: .leading) {
                Text("New Wave Computers")
                    .font(.title2.bold())
                    .foregroundStyle(Color.waveNavy)
                Text("Ride the wave of technology.")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

struct ProductRow: View {
    let product: Product

    var body: some View {
        HStack(spacing: 12) {
            ProductImage(product: product, size: 60)
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.headline)
                Text(product.priceText)
                    .foregroundStyle(Color.waveBlue)
            }
        }
    }
}

/// Like StatsView in the workout example: a small view that only
/// displays data from the shared Cart object.
struct CartSummaryBar: View {
    var cart: Cart

    var body: some View {
        HStack {
            Image(systemName: "cart.fill")
            Text("\(cart.itemCount) item\(cart.itemCount == 1 ? "" : "s") in cart")
            Spacer()
            Text(cart.total.formatted(.currency(code: "USD")))
                .bold()
        }
        .padding()
        .foregroundStyle(.white)
        .background(Color.waveNavy)
    }
}

#Preview {
    ShopView(cart: Cart())
}
