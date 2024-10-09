//
//  HanvestNumberButton.swift
//  hanvest
//
//  Created by Bryan Vernanda on 09/10/24.
//

import SwiftUI

struct HanvestModuleNumberButton: View {
    @State var state: HanvestModuleNumberDefaultState = .unpressed
    var style: HanvestModuleNumberDefaultStyle = .current
    
    var number: Int
    var image: Image?
    var action: () -> Void
    
    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                Circle()
//                    .foregroundStyle(.seagull400)
//                    .frame(
//                        width: min(geometry.size.width, geometry.size.height) * 0.8,
//                        height: min(geometry.size.width, geometry.size.height) * 0.8
//                    )
//                Text("1")
//                    .foregroundStyle(.mineShaft50)
//                    .fontWeight(.bold)
//                    .font(.system(size: min(geometry.size.width, geometry.size.height) * 0.4))
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
//        .aspectRatio(1, contentMode: .fit)
        
        
        HStack {
            Text("\(number)")
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .foregroundStyle(.mineShaft50)
                .scaleEffect(getPressedStatus() ? 0.98 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        }
        .frame(minWidth: 80)
        .background(
            Circle()
                .fill(style.backgroundColor)
                .shadow(
                    color: getPressedStatus() ? .clear : style.shadowColor,
                    radius: getPressedStatus() ? 0 : 0, x: 0, y: getPressedStatus() ? 0 : 4
                )
        )
        .scaleEffect(getPressedStatus() ? 0.98 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        .onTapGesture {
             action()
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
             action()
         })
    }
    
    func getPressedStatus() -> Bool {
        return state == .pressed
    }
}


#Preview {
    VStack {
        HanvestModuleNumberButton(
            style: .current,
            number: 1, action: {
                print("Hello World!")
            })
    }
    .padding(.horizontal, 16)
}
