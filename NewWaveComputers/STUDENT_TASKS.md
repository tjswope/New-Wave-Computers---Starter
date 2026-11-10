# New Wave Computers – Reactive SwiftUI Lab

New Wave Computers sells **NW-PCs**, **newPhones**, **hard drives**, and **duck tape**.
The app already runs, but it isn't *reactive* yet: tap the buttons and nothing on screen changes.
Your job is to finish the TODOs so SwiftUI redraws the screen whenever the data changes.

Find each TODO with **Find Navigator (⌘⇧F) → "TODO"**. Run the app after every part.

## Part 1 – Simple values with @State  (`Views/ProductDetailView.swift`)
- **TODO 1** – Mark `quantity` and `isFavorite` with `@State`.
- **TODO 1b / 1c** – Make the − and + buttons change `quantity` (never below 1).
- **TODO 2** – Make the heart button toggle `isFavorite`.

✅ Check: open a product. The heart fills in and the quantity changes.

## Part 2 – Your own struct in @State + @Binding  (`Views/BuildPCView.swift`)
- **TODO 3** – Mark `build` (a `PCBuild` struct) with `@State`.
- **TODO 4a** – In `OptionStepper`, change `let value: Int` to `@Binding var value: Int` and use a `Stepper`.
- **TODO 4b** – Pass bindings (`$build.memoryGB`, `$build.storageTB`, `$build.hasDuckTapeWrap`).

✅ Check: change the memory, storage, and duck tape wrap. The price updates right away.

## Part 3 – Your first @Observable class  (`Model/RewardsCard.swift`, `Views/RewardsView.swift`)
- **TODO 5** – Add `@Observable` to the `RewardsCard` class.
- **TODO 6** – In `RewardsView`, own the card with `@State private var rewards = RewardsCard()`.

✅ Check: "Check In" adds 25 points, and your level changes at 100 and 200 points.

## Part 4 – Sharing one @Observable object  (`Model/Cart.swift`, `Views/ContentView.swift`)
- **TODO 7** – Add `@Observable` to the `Cart` class.
- **TODO 8a / 8b** – Write `itemCount` and `total`.
- **TODO 8c** – Write `add(_:quantity:)`. Read the hint about structs!
- **TODO 9** – Add a `.badge` to the Cart tab.

✅ Check: add products from the **Shop** and **Build** tabs. The Cart tab, its badge, and the bar at the bottom of the Shop tab all update. They are all looking at the **same** `Cart` object.

## Part 5 – Value vs. reference  (`Lab/CopyLabView.swift`)
- **TODO 10** – Write your prediction, then write the class experiment.

✅ Check: explain why the struct's original price stays $999.99 but the class's original price changes.

## Reflection questions
1. Why does `ProductDetailView` use `@State` for `quantity` instead of putting it in the `Cart`?
2. `ShopView`, `CartView`, and `ContentView` each have `var cart: Cart`. Are there three carts or one? How do you know?
3. In Part 3, what happened when you tapped **Check In** before adding `@Observable`? Did `points` change? Why didn't the screen?
4. `RewardsView` creates its card with `@State`, but `CartView` just has `var cart: Cart`. Why the difference?
