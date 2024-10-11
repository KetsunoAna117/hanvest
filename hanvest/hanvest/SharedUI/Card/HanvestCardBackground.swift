//
//  HanvestCardBackground.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 10/10/24.
//

import SwiftUI

struct HanvestCardBackground<Content: View>: View {
    let content: Content
    
    // Constructor to pass content dynamically
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.mineShaft200, lineWidth: 1)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.mineShaft50)
                    )
            )
    }
}

#Preview {
    HanvestCardBackground {
        VStack(alignment: .leading) {
            Text("This is a title")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 4)
            
            HStack {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus tellus nulla, ut blandit neque rutrum in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sem lectus, semper a libero ut, congue sodales sem. Ut convallis volutpat ipsum quis maximus.")
            }
            
            HStack {
                HanvestButtonDefault(
                    size: .medium,
                    style: .filledIncorrect(isDisabled: false),
                    title: "Cancel"
                ) {
                    print("Button Cancel")
                }
                HanvestButtonDefault(
                    size: .medium,
                    style: .filledCorrect(isDisabled: false),
                    title: "Confirm"
                ) {
                    print("Button Confirm")
                }
            }
            .padding(.top, 8)
        }
    }
}

