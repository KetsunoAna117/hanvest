//
//  Popup.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

enum Popup: Identifiable, Hashable, Equatable {
    case withButton(title: String, desc: String, action: () -> ())
    case withoutButton(title: String, action: () -> ())
    
    var id: Self { return self }
}

extension Popup {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .withButton:
            hasher.combine(self.hashValue)
        case .withoutButton:
            hasher.combine(self.hashValue)
        }
    }
    
    // Conform to Equatable
    static func == (lhs: Popup, rhs: Popup) -> Bool {
        switch (lhs, rhs) {
        case (.withButton, .withButton), (.withoutButton, .withoutButton):
            return true
        default:
            return false
        }
    }
}
