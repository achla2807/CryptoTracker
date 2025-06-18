//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by Achla Ajay on 26/05/25.
//

import Foundation
import SwiftUI

class HapticManager{
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        generator.notificationOccurred(type)
    }
    
}
