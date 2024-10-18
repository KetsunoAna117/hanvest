//
//  ScrollableViewModifier.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct ScrollViewIfNeeded<Content: View>: View {
    @ViewBuilder let content: () -> Content

    @State private var scrollViewSize: CGSize = .zero
    @State private var contentSize: CGSize = .zero

    var body: some View {
        ScrollView(shouldScroll ? [.vertical] : []) {
            content().readSize($contentSize)
        }
        .readSize($scrollViewSize)
    }

    private var shouldScroll: Bool {
        scrollViewSize.height <= contentSize.height
    }
}

struct SizeReaderModifier: ViewModifier  {
    @Binding var size: CGSize
    
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry in
                Color.clear.onAppear() {
                    DispatchQueue.main.async {
                         size = geometry.size
                    }
                }
            }
        )
    }
}

extension View {
    func readSize(_ size: Binding<CGSize>) -> some View {
        self.modifier(SizeReaderModifier(size: size))
    }
}


