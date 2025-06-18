//
//  XMarkButton.swift
//  SwiftfulCrypto
//
//  Created by Achla Ajay on 21/05/25.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
                 dismiss()

           }, label: {
                Image(systemName: "xmark")
                    .font(.headline)
        })
    }
}

#Preview {
    XMarkButton()
}
