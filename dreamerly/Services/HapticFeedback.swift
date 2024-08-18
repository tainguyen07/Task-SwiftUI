//
//  HapticFeedback.swift
//  dreamerly
//
//  Created by Tai Nguyen on 18/8/24.
//

import Foundation
import UIKit

class HapticFeedback {
    static func triggerHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}
