//
//  FontTheme.swift
//  blume-swiftui-ios
//
//  Created by Kent Onyx Arintok on 5/9/25.
//

import Foundation
import SwiftUI

import SwiftUI

extension Font {
    // MARK: - Aeonik TRIAL Fonts
    static func aeonikRegular(size: CGFloat) -> Font {
        .custom("AeonikTRIAL-Regular", size: size)
    }
    
    static func aeonikBold(size: CGFloat) -> Font {
        .custom("AeonikTRIAL-Bold", size: size)
    }

    static func aeonikLight(size: CGFloat) -> Font {
        .custom("AeonikTRIAL-Light", size: size)
    }

    static func aeonikItalic(size: CGFloat) -> Font {
        .custom("AeonikTRIAL-RegularItalic", size: size)
    }

    static func aeonikBoldItalic(size: CGFloat) -> Font {
        .custom("AeonikTRIAL-BoldItalic", size: size)
    }

    static func aeonikLightItalic(size: CGFloat) -> Font {
        .custom("AeonikTRIAL-LightItalic", size: size)
    }

    // MARK: - Crapaud Fonts
    static func crapaudGros(size: CGFloat) -> Font {
        .custom("Crapaud-gros", size: size)
    }

    static func crapaudPetit(size: CGFloat) -> Font {
        .custom("Crapaud-petit", size: size)
    }
}
