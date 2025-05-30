//
//  BlumeMainTextField.swift
//  BlumeSwiftUI
//
//  Created by Kent Onyx Arintok on 5/17/25.
//

import SwiftUI

public struct BlumeNextButton: View {
    
    public var nextTitle: String
    public var nextAction: () -> Void
    public var tryAgainAction: () -> Void
    public var showTryAgain: Bool
    
    public init(
        nextTitle: String = "Next",
        showTryAgain: Bool = false,
        tryAgainAction: @escaping () -> Void = {},
        nextAction: @escaping () -> Void = {}
    ) {
        self.nextTitle = nextTitle
        self.showTryAgain = showTryAgain
        self.tryAgainAction = tryAgainAction
        self.nextAction = nextAction
    }
    
    public var body: some View {
        VStack {
            Spacer()
            
            HStack {
                if showTryAgain {
                    Button(action: tryAgainAction) {
                        Text("Try Again")
                            .font(.aeonikLight(size: 18))
                            .foregroundStyle(Color(hex: "#303030"))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "#F8F7F6"))
                    .cornerRadius(50)
                } else {
                    Button(action: {}) {
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                
                
                Button(action: nextAction) {
                    Text(nextTitle)
                        .font(.aeonikLight(size: 18))
                        .foregroundStyle(Color(hex: "#303030"))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(hex: "#C0C0C0").opacity(0.5))
                .cornerRadius(50)
            }
            .padding(.horizontal)
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    BlumeNextButton(nextTitle: "Continue",
                    showTryAgain: false,
                    tryAgainAction: { /*try again action*/ },
                    nextAction: { /*next action*/ }
    )
}
