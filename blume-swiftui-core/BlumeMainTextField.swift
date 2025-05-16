//
//  BlumeMainTextField.swift
//  blume-swiftui-core
//
//  Created by Kent Onyx Arintok on 5/17/25.
//

import SwiftUI

struct BlumeMainTextField: View {
    
    let label: String
    let placeholder: String
    let imageName: String
    @Binding var text: String
    
    init(
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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(label)
                .font(.aeonikRegular(size: 16))
                .foregroundColor(Color(hex: "#303030"))
            HStack {
                Image("\(imageName)")
                    .foregroundColor(Color(hex: "#ABA7A7"))
                    .frame(width: 24, height: 24)
                TextField(placeholder, text: $text)
                    .font(.aeonikRegular(size: 18))
                    .foregroundColor(.black)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
            }
            .padding()
            .background(Color(hex: "#F2F2F2"))
            .cornerRadius(32)
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
