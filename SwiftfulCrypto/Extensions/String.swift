//
//  String.swift
//  SwiftfulCrypto
//
//  Created by Achla Ajay on 04/06/25.
//

import Foundation

extension String{
    
    
    var removingHTMLOccurences: String{
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
