//
//  HanvestButtonDefault.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

struct HanvestButtonDefault: View {
    var size: HanvestButtonDefaultSize = .large
    var style: HanvestButtonDefaultStyle = .filled(isDisabled: false)
    var iconPosition: HanvestButtonDefaultIconPosition = .leading
    
    @State private var state: HanvestButtonDefaultState = .unpressed
    
    var title: String
    var image: Image?
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .foregroundStyle(getDisabledStatus() ? .labelTertiary : style.fontColor)
                .scaleEffect(getPressedStatus() ? 0.98 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        }
        .frame(minWidth: size.rawValue)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(style.backgroundColor)
                .shadow(
                    color: getPressedStatus() ? .clear : style.shadowColor,
                    radius: getPressedStatus() ? 0 : 0, x: 0, y: getPressedStatus() ? 0 : 4 // Shadow changes when pressed
                )
            
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(style.borderColor, lineWidth: 0.5) // Default stroke
        )
        .scaleEffect(getPressedStatus() ? 0.98 : 1.0) // Button scales down slightly when pressed
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        .onTapGesture {
            if self.state != .disabled {
                action()
            }
        }
        .onLongPressGesture(minimumDuration: 0.1, pressing: { isPressing in
            withAnimation {
                if isPressing {
                    self.state = .pressed
                }
                else {
                    self.state = .unpressed
                }
            }
        }, perform: {
            if self.state != .disabled {
                action()
            }
        })
        .onAppear {
            if style.isDisabled {
                self.state = .disabled
            }
        }
        .disabled(getDisabledStatus())
    }
    
    func getPressedStatus() -> Bool {
        return state == .pressed
    }
    
    func getDisabledStatus() -> Bool {
        // If the style is marked as disabled, return true
        if case .filled(let isDisabled) = style, isDisabled {
            state = .disabled
        }
        return state == .disabled
    }

}

#Preview {
    VStack {
        HanvestButtonDefault(
            style: .filled(isDisabled: true),
            title: "Button", action: {
                print("Hello World!")
            })
    }
    .padding(.horizontal, 16)
}
