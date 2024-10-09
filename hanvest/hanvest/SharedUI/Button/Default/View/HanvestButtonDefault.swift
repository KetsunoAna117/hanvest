//
//  HanvestButtonDefault.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

struct HanvestButtonDefault: View {
    // Constants
    let SHADOW_OFFSET: CGFloat = 5
    
    // Styling Variable (Initialized Before)
    var size: HanvestButtonDefaultSize = .large
    var style: HanvestButtonDefaultStyle = .filled(isDisabled: false)
    var iconPosition: HanvestButtonDefaultIconPosition = .leading
    
    @State private var state: HanvestButtonDefaultState = .unpressed
    
    // Button content
    var title: String
    var image: Image?
    var action: () -> Void
    
    var body: some View {
        HStack {
            // If the icon position is leading, place the image first
            if iconPosition == .leading, let image = image {
                image
                    .foregroundStyle(getDisabledStatus() ? .labelTertiary : style.fontColor)
            }
            
            Text(title)
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .foregroundStyle(getDisabledStatus() ? .labelTertiary : style.fontColor)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
            
            // If the icon position is trailing, place the image first
            if iconPosition == .trailing, let image = image {
                image
                    .foregroundStyle(getDisabledStatus() ? .labelTertiary : style.fontColor)
            }
        }
        .frame(minWidth: size.rawValue)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(style.backgroundColor)
                .shadow(
                    color: getPressedStatus() ? .clear : style.shadowColor,
                    radius: getPressedStatus() ? 0 : 0, x: 0, y: getPressedStatus() ? 0 : SHADOW_OFFSET // Shadow changes when pressed
                )
            
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(style.borderColor, lineWidth: 0.5) // Default stroke
        )
        .offset(y: getPressedStatus() ? SHADOW_OFFSET : 0) // Button moves down by 4 points when pressed
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
            else {
                self.state = .unpressed
            }
        }
        .disabled(getDisabledStatus())
    }
    
    func getPressedStatus() -> Bool {
        return state == .pressed
    }
    
    func getDisabledStatus() -> Bool {
        return state == .disabled
    }
    
}

#Preview {
    VStack {
        HanvestButtonDefault(
            size: .large,
            style: .filled(isDisabled: false),
            iconPosition: .hidden,
            title: "Button",
            image: Image(systemName: "person.fill"),
            action: {
                print("Hello World!")
            }
        )
    }
    .padding(.horizontal, 16)
}
