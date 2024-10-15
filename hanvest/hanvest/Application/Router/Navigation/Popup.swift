//
//  Popup.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

enum Popup: String, Identifiable, Hashable {
    case moduleInformation
    
    var id: Self { return self }
}

extension Popup {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .moduleInformation:
            hasher.combine(self.hashValue)
        }
    }
    
    // Conform to Equatable
    static func == (lhs: Popup, rhs: Popup) -> Bool {
        switch (lhs, rhs) {
        case (.moduleInformation, .moduleInformation):
            return true
        }
    }
}
