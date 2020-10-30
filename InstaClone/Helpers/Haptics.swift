//
//  Haptics.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 30/10/2020.
//

import UIKit

enum Haptics {
    static func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}
