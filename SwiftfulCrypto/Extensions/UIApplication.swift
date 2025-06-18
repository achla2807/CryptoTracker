//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Achla Ajay on 19/05/25.
//

import Foundation
import SwiftUI

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
