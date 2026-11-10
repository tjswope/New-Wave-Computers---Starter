//
//  ContentView.swift
//  New Wave Computers
//

import SwiftUI

struct ContentView: View {
    var cart: Cart

    var body: some View {
        TabView {
            ShopView(cart: cart)
                .tabItem { Label("Shop", systemImage: "bag") }

            BuildPCView(cart: cart)
                .tabItem { Label("Build", systemImage: "wrench.and.screwdriver") }

            CartView(cart: cart)
                .tabItem { Label("Cart", systemImage: "cart") }
                // TODO 9: Add .badge(cart.itemCount) here so the Cart tab
                //         shows how many things are in the cart.

            RewardsView()
                .tabItem { Label("Rewards", systemImage: "star.circle") }

            CopyLabView()
                .tabItem { Label("Copy Lab", systemImage: "doc.on.doc") }
        }
        .tint(Color.waveBlue)
    }
}

#Preview {
    ContentView(cart: Cart())
}
