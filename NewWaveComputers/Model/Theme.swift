//
//  Theme.swift
//  New Wave Computers
//
//  Brand colors for New Wave Computers, taken from the logo.
//

import SwiftUI

extension Color {
    static let waveNavy  = Color(red: 0.04, green: 0.20, blue: 0.33)
    static let waveBlue  = Color(red: 0.18, green: 0.49, blue: 0.69)
    static let waveFoam  = Color(red: 0.87, green: 0.93, blue: 0.91)
    static let waveCoral = Color(red: 0.95, green: 0.45, blue: 0.33)
}

/// Shows a product's picture. If the picture hasn't been added to
/// Assets.xcassets yet, it shows the product's SF Symbol instead.
struct ProductImage: View {
    let product: Product
    var size: CGFloat = 80

    var body: some View {
        Group {
            if UIImage(named: product.imageName) != nil {
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: product.symbolName)
                    .resizable()
                    .scaledToFit()
                    .padding(size * 0.22)
                    .foregroundStyle(Color.waveBlue)
            }
        }
        .frame(width: size, height: size)
        .background(Color.waveFoam, in: RoundedRectangle(cornerRadius: size * 0.15))
        .clipShape(RoundedRectangle(cornerRadius: size * 0.15))
    }
}
