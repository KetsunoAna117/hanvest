//
//  HanvestCorrectionSymbol.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 10/10/24.
//

import SwiftUI

struct HanvestCorrectionSymbol: View {
    var state: HanvestCorrectionSymbolState
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(state.backgroundColor)
            Image(systemName: state.icon)
                .resizable()
                .frame(width: 14, height: 14)
                .foregroundStyle(state.fontColor)
        }
        .frame(width: 25, height: 25)
    }
}

#Preview {
    HanvestCorrectionSymbol(state: .correct)
}
