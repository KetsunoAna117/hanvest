//
//  HanvestNumberButton.swift
//  hanvest
//
//  Created by Bryan Vernanda on 09/10/24.
//

import SwiftUI

struct HanvestModuleNumberButton: View {
    // Constants
    let SHADOW_OFFSET: CGFloat = 5
    
    @State var state: HanvestModuleNumberDefaultState = .pressed
    
    // Styling variable
    var style: HanvestModuleNumberDefaultStyle = .current
    
    // Button content
    var number: Int?
    var image: Image?
    var action: () -> Void
    
    @ViewBuilder
    var imageOrNumberViewBuilder: some View {
        if let image = image {
            image
        } else if let number = number {
            Text("\(number)")
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(style.backgroundColor)
                .shadow(
                    color: getPressedStatus() ? .clear : style.shadowColor,
                    radius: getPressedStatus() ? 0 : 0, x: 0, y: getPressedStatus() ? 0 : SHADOW_OFFSET
                )
                
            imageOrNumberViewBuilder
                .font(.nunito(.largeTitle, .bold))
                .foregroundStyle(.mineShaft50)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        }
        .frame(maxWidth: 80, maxHeight: 80)
        .offset(y: getPressedStatus() ? SHADOW_OFFSET : 0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        .onTapGesture {
             action()
         }
        .onLongPressGesture(minimumDuration: 0.1, pressing: { isPressing in
             withAnimation {
                 if isPressing {
                     self.state = .pressed
                 }
                 else if self.style == .current {
                     self.state = .unpressed
                 }
             }
         }, perform: {
             if self.style == .current {
                 action()
             }
         })
        .onAppear {
            if self.style == .current {
                self.state = .unpressed
            }
        }
    }
    
    func getPressedStatus() -> Bool {
        return state == .pressed
    }
}


#Preview {
    // To test for checkmark:
    // change "number" param to "image" with the content is
    // Image(systemName: "checkmark")
    // and change style to .done
    
    VStack {
        HanvestModuleNumberButton(
            style: .current,
            number: 1, action: {
                print("Hello World!")
            })
    }
    .padding(.horizontal, 16)
}
