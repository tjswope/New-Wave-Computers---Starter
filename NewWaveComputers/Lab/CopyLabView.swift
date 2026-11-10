//
//  CopyLabView.swift
//  New Wave Computers
//
//  PART 5 - Value types vs. reference types.
//  Both experiments do the SAME thing:
//    1. make an original price tag for an NW-PC ($999.99)
//    2. copy it with  copy = original
//    3. put the COPY on sale ($799.99)
//  Before you run them, PREDICT: does the original's price change too?
//

import SwiftUI

/// A STRUCT: value type. Assigning makes a brand-new copy.
struct PriceTagStruct {
    var price: Double
}

/// A CLASS: reference type. Assigning copies the REFERENCE (the arrow),
/// so both variables point at the same object.
class PriceTagClass {
    var price: Double

    init(price: Double) {
        self.price = price
    }
}

struct CopyLabView: View {
    @State private var structResult = "Tap to run"
    @State private var classResult = "Tap to run"

    func runStructExperiment() {
        let original = PriceTagStruct(price: 999.99)
        var copy = original
        copy.price = 799.99
        structResult = "original: \(dollars(original.price))   copy: \(dollars(copy.price))"
    }

    func runClassExperiment() {
        // TODO 10: Write the same experiment as runStructExperiment(),
        //          but use PriceTagClass(price: 999.99) instead.
        //          (Notice: copy can be a let constant this time. Why?)
        //          Then set classResult the same way.
        //          Write your PREDICTION here before you run it:
        //          Prediction:
    }

    func dollars(_ amount: Double) -> String {
        amount.formatted(.currency(code: "USD"))
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("Make an NW-PC price tag for $999.99, copy it, then put the **copy** on sale for $799.99. Does the **original** change too?")
                }

                Section("Struct (value type)") {
                    Button("Run struct experiment") { runStructExperiment() }
                    Text(structResult)
                        .font(.system(.body, design: .monospaced))
                }

                Section("Class (reference type)") {
                    Button("Run class experiment") { runClassExperiment() }
                    Text(classResult)
                        .font(.system(.body, design: .monospaced))
                }

                Section {
                    Button("Reset", role: .destructive) {
                        structResult = "Tap to run"
                        classResult = "Tap to run"
                    }
                }
            }
            .navigationTitle("Copy Lab")
        }
    }
}

#Preview {
    CopyLabView()
}
