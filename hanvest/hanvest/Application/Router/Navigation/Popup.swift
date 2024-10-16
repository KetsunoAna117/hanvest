//
//  Popup.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import SwiftUI

enum Popup: Identifiable, Hashable, Equatable {
    case tapOutsideEnabled(view: AnyView, action: () -> ())
    case tapOutsideDisabled(view: AnyView)
    
    var id: Self { return self }
}

extension Popup {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .tapOutsideEnabled:
            hasher.combine(self.hashValue)
        case .tapOutsideDisabled:
            hasher.combine(self.hashValue)
        }
    }
    
    // Conform to Equatable
    static func == (lhs: Popup, rhs: Popup) -> Bool {
        switch (lhs, rhs) {
        case (.tapOutsideEnabled, .tapOutsideEnabled), (.tapOutsideDisabled, .tapOutsideDisabled):
            return true
        default:
            return false
        }
    }
}
