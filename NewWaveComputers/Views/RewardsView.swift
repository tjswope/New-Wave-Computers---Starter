//
//  RewardsView.swift
//  New Wave Computers
//
//  PART 3 - Owning an @Observable object with @State.
//

import SwiftUI

struct RewardsView: View {
    // TODO 6: After TODO 5, change this to  @State private var rewards = RewardsCard()
    //         @State creates the RewardsCard ONCE and keeps it alive while
    //         the view redraws. Because the class is @Observable, SwiftUI
    //         redraws this view whenever points or memberName changes.
    //         (Right now the buttons DO change points... but the screen never
    //          finds out. Try it before and after!)
    var rewards = RewardsCard()

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Member: \(rewards.memberName)")
                    .font(.headline)

                ZStack {
                    Circle()
                        .fill(Color.waveFoam)
                        .frame(width: 200, height: 200)
                    VStack {
                        Text("\(rewards.points)")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundStyle(Color.waveNavy)
                        Text("Wave Points")
                            .foregroundStyle(.secondary)
                    }
                }

                Text("Level: \(rewards.level)")
                    .font(.title2.bold())
                    .foregroundStyle(Color.waveBlue)

                Button("Check In at the Store (+25)") {
                    rewards.checkIn()
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.waveBlue)

                Button("Redeem 50 Points for Free Duck Tape") {
                    rewards.redeemDuckTape()
                }
                .buttonStyle(.bordered)
                .tint(Color.waveCoral)
                .disabled(rewards.points < 50)

                Spacer()
            }
            .padding()
            .navigationTitle("Wave Rewards")
        }
    }
}

#Preview {
    RewardsView()
}
