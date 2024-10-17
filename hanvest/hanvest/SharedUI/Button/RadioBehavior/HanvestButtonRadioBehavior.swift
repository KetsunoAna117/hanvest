//
//  HanvestButton.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

struct HanvestButtonRadioBehavior: View {
    // Constants
    let SHADOW_OFFSET: CGFloat = 5
    
    // Styling Variable (Initialized Before)
    var size: HanvestButtonSize = .large
    var style: HanvestButtonStyle = .filled(isDisabled: false)
    var iconPosition: HanvestButtonIconPosition = .leading
    
    @State private var state: HanvestButtonState = .unpressed
    
    // Bind to the parent selection
    @Binding var selectedButtonID: String
    
    // Button content
    var id: String = UUID().uuidString
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
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.nunito(.body))
            
            // If the icon position is trailing, place the image first
            if iconPosition == .trailing, let image = image {
                image
                    .foregroundStyle(getDisabledStatus() ? .labelTertiary : style.fontColor)
            }
        }
        .frame(maxWidth: size.minWidth)
        .padding(.horizontal, size.horizontalPadding)
        .padding(.vertical, size.verticalPadding)
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
            if self.state != .disabled &&
                self.selectedButtonID != self.id {
                self.state = .pressed
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                    self.selectedButtonID = self.id
                    print("Selected Button ID: \(selectedButtonID)")
                    action()
                })
            }
        }
        .onAppear {
            setupState()
        }
        .onChange(of: selectedButtonID, { oldValue, newValue in
            if newValue != self.id {
                if self.state != .disabled {
                    self.state = .unpressed
                }
            }
        })
        .disabled(getDisabledStatus())
    }
    
    func getPressedStatus() -> Bool {
        return state == .pressed
    }
    
    func getDisabledStatus() -> Bool {
        return state == .disabled
    }
    
    func setupState() {
        if style.isDisabled {
            self.state = .disabled
        }
        else {
            self.state = .unpressed
        }
    }
    
}

#Preview {
    @Previewable @State var selectedButtonID = ""
    
    VStack() {
        HStack {
            VStack(alignment: .leading) {
                Text("This is a button example!")
                    .font(.nunito(.title3, .bold))
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget libero a urna porttitor rutrum.")
                    .font(.nunito(.body))
            }
            Spacer()
        }
        VStack(spacing: 16) {
            HanvestButtonRadioBehavior(
                size: .medium,
                style: .filled(isDisabled: false),
                iconPosition: .leading,
                selectedButtonID: $selectedButtonID,
                id: "Third-Button",
                title: "Button",
                image: Image(systemName: "person.fill"),
                action: {
                   
                }
            )
            HanvestButtonRadioBehavior(
                size: .medium,
                style: .filledCorrect(isDisabled: false),
                iconPosition: .leading,
                selectedButtonID: $selectedButtonID,
                id: "First-Button",
                title: "Button",
                image: Image(systemName: "person.fill"),
                action: {
                    
                }
            )
            HanvestButtonRadioBehavior(
                size: .medium,
                style: .filledIncorrect(isDisabled: false),
                iconPosition: .leading,
                selectedButtonID: $selectedButtonID,
                id: "Second-Button",
                title: "Button",
                image: Image(systemName: "person.fill"),
                action: {
                    
                }
            )
        }
        .padding(.top, 8)
    }
    .padding(.horizontal, 16)
}
