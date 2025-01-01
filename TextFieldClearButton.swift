//
//  File.swift
//  UnWasteIt
//
//  Created by admin on 4/14/22.
//

import SwiftUI
import AVFoundation
import Foundation

// A modifier that clears a textfield
struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        HStack {
            content
            
            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "delete.left")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
            }
        }
    }
}
