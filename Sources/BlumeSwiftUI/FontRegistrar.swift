//
//  File.swift
//  BlumeSwiftUI
//
//  Created by Kent Onyx Arintok on 5/17/25.
//

import Foundation
import CoreGraphics
import CoreText

public struct FontRegistrar {
    public static func registerAllFonts() {
        let aeonikFonts = [
            "AeonikTRIAL-Regular",
            "AeonikTRIAL-Bold",
            "AeonikTRIAL-Light",
            "AeonikTRIAL-RegularItalic",
            "AeonikTRIAL-BoldItalic",
            "AeonikTRIAL-LightItalic"
        ]

        let crapaudFonts = [
            "Crapaud_gros",
            "Crapaud_petit"
        ]

        (aeonikFonts.map { ("CustomFont/Aeonik", $0) } +
         crapaudFonts.map { ("CustomFont/Crapaud", $0) }).forEach { folder, name in
            registerFont(named: name, in: folder)
        }
    }

    private static func registerFont(named name: String, in folder: String) {
        guard let fontURL = Bundle.module.url(forResource: name, withExtension: "ttf", subdirectory: folder),
              let dataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(dataProvider) else {
            print("❌ Could not load font: \(folder)/\(name).ttf")
            return
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            print("❌ Could not register font: \(name), error: \(String(describing: error?.takeUnretainedValue()))")
        } else {
            print("✅ Registered font: \(name)")
        }
    }
}
