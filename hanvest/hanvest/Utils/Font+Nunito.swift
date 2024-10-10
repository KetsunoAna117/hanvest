//
//  Font+Nunito.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

enum NunitoFontWeight: String {
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
            case .regular:
                "Nunito-Medium"
            case .bold:
                "Nunito-Bold"
        }
    }
}

enum NunitoFontSize: String {
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
    // MARK: - Usage Example:
    // .font(.nunito(.regular, .XLTitle))
    static func nunito(
        _ fontWeight: NunitoFontWeight,
        _ fontSize: NunitoFontSize
    ) -> Font {
        return Font.custom(fontWeight.value, size: fontSize.size)
    }
    
    // MARK: - Usage Example:
    // .font(.nunito(.regular, size: 46))
    static func nunito(
        _ fontWeight: NunitoFontWeight,
        size: CGFloat
    ) -> Font {
        return Font.custom(fontWeight.value, size: size)
    }
}
