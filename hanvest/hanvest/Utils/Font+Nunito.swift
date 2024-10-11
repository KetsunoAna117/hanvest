//
//  Font+Nunito.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

enum NunitoFontWeight {
//    case black
    case bold
//    case heavy
//    case light
//    case medium
    case regular
//    case semibold
//    case thin
//    case ultraLight
    
    var value: String {
        switch self {
            case .bold:
                "Nunito-Bold"
            case .regular:
                "Nunito-Medium"
        }
    }
}

enum NunitoFontSize {
    case XLTitle
    case largeTitle
    case title1
    case title2
    case title3
    case title4
    case body
    case callout
    case subhead
    case footnote
    case caption1
    case caption2
    
    var size: CGFloat {
        switch self {
            case .XLTitle:
                46
            case .largeTitle:
                34
            case .title1:
                28
            case .title2:
                28
            case .title3:
                22
            case .title4:
                20
            case .body:
                17
            case .callout:
                16
            case .subhead:
                15
            case .footnote:
                13
            case .caption1:
                12
            case .caption2:
                11
        }
    }
}

extension Font {
    // Static nested struct to simulate a namespace
    struct Nunito {
        // Default is regular weight
        static func largeTitle() -> Font {
            return Font.custom(NunitoFontWeight.regular.value, size: NunitoFontSize.largeTitle.size)
        }
        
        static func title1() -> Font {
            return Font.custom(NunitoFontWeight.regular.value, size: NunitoFontSize.title1.size)
        }
        
        static func title2() -> Font {
            return Font.custom(NunitoFontWeight.regular.value, size: NunitoFontSize.title2.size)
        }
        
        static func body() -> Font {
            return Font.custom(NunitoFontWeight.regular.value, size: NunitoFontSize.body.size)
        }
        
        static func regular(_ size: NunitoFontSize = .body) -> Font {
            return Font.custom(NunitoFontWeight.regular.value, size: size.size)
        }
        
        static func bold(_ size: NunitoFontSize = .body) -> Font {
            return Font.custom(NunitoFontWeight.bold.value, size: size.size)
        }
        
        // Convenience method for custom sizes
        static func regular(size: CGFloat) -> Font {
            return Font.custom(NunitoFontWeight.regular.value, size: size)
        }

        static func bold(size: CGFloat) -> Font {
            return Font.custom(NunitoFontWeight.bold.value, size: size)
        }
    }
}

// Usage Examples:
// .font(.nunito.largeTitle())
extension Font {
    static var nunito: Nunito.Type {
        return Nunito.self
    }
}
