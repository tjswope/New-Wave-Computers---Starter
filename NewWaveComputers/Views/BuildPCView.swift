//
//  BuildPCView.swift
//  New Wave Computers
//
//  PART 2 - Your own struct in @State, shared with a child view by @Binding.
//

import SwiftUI

struct BuildPCView: View {
    var cart: Cart

    // TODO 3: build is a PCBuild struct that changes as the customer picks
    //         options. Change it to  @State private var build = PCBuild()
    //         so this view owns it and redraws whenever ANY of its properties change.
    var build = PCBuild()

    var body: some View {
        NavigationStack {
            Form {
                Section("Your NW-PC") {
                    HStack(spacing: 16) {
                        ProductImage(product: .nwPC, size: 70)
                        VStack(alignment: .leading) {
                            Text("Custom NW-PC")
                                .font(.headline)
                            Text(build.price.formatted(.currency(code: "USD")))
                                .font(.title2.bold())
                                .foregroundStyle(Color.waveBlue)
                        }
                    }
                }

                Section("Options") {
                    // TODO 4b: After you finish TODO 4a, pass BINDINGS instead of values:
                    //          value: $build.memoryGB  and  value: $build.storageTB
                    //          and change .constant(build.hasDuckTapeWrap) to $build.hasDuckTapeWrap
                    OptionStepper(title: "Memory", unit: "GB", value: build.memoryGB, range: 16...128, step: 16)
                    OptionStepper(title: "Storage", unit: "TB", value: build.storageTB, range: 1...8, step: 1)
                    Toggle("Duck Tape Wrap (+$6.49)", isOn: .constant(build.hasDuckTapeWrap))
                }

                Section {
                    Button("Add Custom NW-PC to Cart") {
                        cart.add(build.asProduct)
                    }
                    .bold()
                }
            }
            .navigationTitle("Build an NW-PC")
        }
    }
}

/// A child view that CHANGES a value owned by its parent.
struct OptionStepper: View {
    let title: String
    let unit: String
    // TODO 4a: This view needs to CHANGE the parent's value, not just show it.
    //          Change "let value: Int" to "@Binding var value: Int".
    //          Then replace the HStack below with:
    //          Stepper("\(title): \(value) \(unit)", value: $value, in: range, step: step)
    let value: Int
    let range: ClosedRange<Int>
    let step: Int

    var body: some View {
        HStack {
            Text("\(title): \(value) \(unit)")
            Spacer()
            Text("TODO 4")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    BuildPCView(cart: Cart())
}
