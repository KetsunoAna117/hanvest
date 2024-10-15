//
//  CompletionCardStyleViewModifier.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct CompletionCardStyleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .background(Color.mineShaft50)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.mineShaft200, lineWidth: 1)
            )
            .shadow(color: Color.black.opacity(0.2), radius: 0.2, x: 0, y: 0)
    }
}

extension View {
    func completionCardStyle() -> some View {
        self.modifier(CompletionCardStyleViewModifier())
    }
}
