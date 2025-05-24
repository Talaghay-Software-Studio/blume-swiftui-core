//
//  BlumeMainTextField.swift
//  BlumeSwiftUI
//
//  Created by Kent Onyx Arintok on 5/17/25.
//

import SwiftUI

/// A customizable text field component with a label and icon.
///
/// This component provides a styled text field with a label, placeholder, and an optional icon.
/// It's designed to be used in forms and input sections of your app.
///
/// ```swift
/// BlumeMainTextField(
///     label: "Email",
///     placeholder: "Enter your email",
///     imageName: "envelope",
///     text: $emailText
/// )
/// ```
public struct BlumeMainTextField: View {
    /// The label text displayed above the text field
    public let label: String
    
    /// The placeholder text shown when the text field is empty
    public let placeholder: String
    
    /// The name of the SF Symbol or asset to display as an icon
    public let imageName: String
    
    /// The binding to the text value
    @Binding public var text: String
    
    /// Creates a new BlumeMainTextField
    /// - Parameters:
    ///   - label: The label text displayed above the text field
    ///   - placeholder: The placeholder text shown when the text field is empty
    ///   - imageName: The name of the SF Symbol or asset to display as an icon
    ///   - text: A binding to the text value
    public init(
        label: String,
        placeholder: String,
        imageName: String,
        text: Binding<String>
    ) {
        self.label = label
        self.placeholder = placeholder
        self.imageName = imageName
        self._text = text
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(label)
                .font(.aeonikRegular(size: 16))
                .foregroundColor(Color(hex: "#303030"))
            HStack {
                Image("\(imageName)")
                    .resizable()
                    .frame(width: 24, height: 24)
                TextField(placeholder, text: $text)
                    .font(.aeonikRegular(size: 18))
                    .foregroundColor(.black)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
            }
            .padding()
            .background(Color(hex: "#F0F0F0"))
            .cornerRadius(50)
        }
    }
}

#Preview {
    BlumeMainTextField(
        label: "Email",
        placeholder: "Drop your @ — we'll keep it safe!",
        imageName: "envelope",
        text: .constant("")
    )
} 
