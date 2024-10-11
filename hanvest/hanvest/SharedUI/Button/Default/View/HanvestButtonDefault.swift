//
//  HanvestButtonDefault.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

/// A Hanvest Button that have multiple styles
/// If you want to freeze a button to state, change the initialState

struct HanvestButtonDefault: View {
    // Constants
    let SHADOW_OFFSET: CGFloat = 5
    
    // Styling Variable (Initialized Before)
    var size: HanvestButtonDefaultSize = .large
    var style: HanvestButtonDefaultStyle = .filled(isDisabled: false)
    var iconPosition: HanvestButtonDefaultIconPosition = .leading
    var initialState: HanvestButtonDefaultState = .unpressed
    
    @State private var state: HanvestButtonDefaultState = .unpressed
    
    // Button content
    var title: String
    var image: Image?
    var action: () -> Void
    
    var body: some View {
        ZStack(alignment: iconPosition.alignment) {
            // If the icon position is leading, place the image first
            if iconPosition == .leading, let image = image {
                image
                    .foregroundStyle(getDisabledStatus() ? .labelTertiary : style.fontColor)
            }
            
            Text(title)
                .foregroundStyle(getDisabledStatus() ? .labelTertiary : style.fontColor)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
                .frame(maxWidth: .infinity, alignment: .center) // Ensure the text is centered
            
            // If the icon position is trailing, place the image first
            if iconPosition == .trailing, let image = image {
                image
                    .foregroundStyle(getDisabledStatus() ? .labelTertiary : style.fontColor)
            }
        }
        .frame(maxWidth: size.rawValue)
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .multilineTextAlignment(.center)
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
                if self.initialState == .unpressed {
                    if isPressing {
                        self.state = .pressed
                    }
                    else {
                        self.state = .unpressed
                    }
                }

            }
        }, perform: {
            if self.state != .disabled {
                action()
            }
        })
        .onAppear {
            setupState()
        }
        .disabled(getDisabledStatus())
    }
    
    func getPressedStatus() -> Bool {
        return state == .pressed
    }
    
    func getDisabledStatus() -> Bool {
        return state == .disabled
    }
    
    func setupState() {
        self.state = initialState
        
        if style.isDisabled || initialState == .disabled {
            self.state = .disabled
        }
        else {
            self.state = .unpressed
        }
    }
    
}

#Preview {
    VStack() {
        HStack {
            VStack(alignment: .leading) {
                Text("This is a button example!")
                    .fontWeight(.bold)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget libero a urna porttitor rutrum.")
            }
            Spacer()
        }
        HanvestButtonDefault(
            size: .large,
            style: .filledIncorrect(isDisabled: false),
            iconPosition: .leading,
            title: "Button",
            image: Image(systemName: "person.fill"),
            action: {
                print("Button Pressed!")
            }
        )
        .padding(.top, 16)
    }
    .padding(.horizontal, 16)
}
