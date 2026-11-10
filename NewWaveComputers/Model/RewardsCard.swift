//
//  RewardsCard.swift
//  New Wave Computers
//
//  PART 3 - Your first @Observable class.
//  A class is a REFERENCE type: every variable that holds a RewardsCard
//  points at the same object.
//

import Foundation
import Observation

// TODO 5: Make RewardsCard observable.
//   Add the @Observable macro on the line above "class RewardsCard".
//   That one line lets SwiftUI watch every property of this class.
class RewardsCard {
    var memberName = "Wave Rider"
    var points = 0

    var level: String {
        if points >= 200 {
            return "Tsunami"
        } else if points >= 100 {
            return "Big Wave"
        } else {
            return "Ripple"
        }
    }

    func checkIn() {
        points += 25
    }

    func redeemDuckTape() {
        if points >= 50 {
            points -= 50
        }
    }
}
