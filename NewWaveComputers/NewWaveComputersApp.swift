//
//  NewWaveComputersApp.swift
//  New Wave Computers
//

import SwiftUI

@main
struct NewWaveComputersApp: App {
    // The app creates ONE cart. @State keeps this object alive for as long
    // as the app runs. Every tab gets a reference to this SAME cart.
    @State private var cart = Cart()

    var body: some Scene {
        WindowGroup {
            ContentView(cart: cart)
        }
    }
}
