//
//  HanvestButtonDefault.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

struct HanvestButtonDefault: View {
    var size: HanvestButtonDefaultSize = .large
    var state: HanvestButtonDefaultState = .unpressed
    var style: HanvestButtonDefaultStyle = .filled
    
    var title: String
    var image: Image?
    var action: () -> Void
    
    var body: some View {
        HStack {
            
        }
    }
}

#Preview {
    VStack {
        HanvestButtonDefault(title: "Button", action: {
            print("Hello World!")
        })
    }
    .padding(.horizontal, 16)
}
