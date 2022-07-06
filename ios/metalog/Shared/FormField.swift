//  FormField.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import SwiftUI

struct FormField: View {
    
    let placeholder: String
    let text: Binding<String>
    let isSecureField: Bool
    
    init(
        placeholder: String,
        text: Binding<String>,
        isSecureField: Bool = false
    ) {
        self.placeholder = placeholder
        self.text = text
        self.isSecureField = isSecureField
    }
    
    var body: some View {
        if isSecureField {
            SecureField(placeholder, text: text)
                .padding()
        } else {
            TextField(placeholder, text: text)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(uiColor: .systemFill), lineWidth: 1)
                )
        }
    }
}

struct FormField_Previews: PreviewProvider {
    static var previews: some View {
        FormField(
            placeholder: "Username",
            text: .constant("Hello")
        )
    }
}
