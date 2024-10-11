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
                22
            case .title3:
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
    static func nunito(_ fontSize: NunitoFontSize, _ fontWeight: NunitoFontWeight = .regular) -> Font {
        return Font.custom(fontWeight.value, size: fontSize.size)
    }
}

