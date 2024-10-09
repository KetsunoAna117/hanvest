//
//  HanvestNumberButton.swift
//  hanvest
//
//  Created by Bryan Vernanda on 09/10/24.
//

import SwiftUI

struct HanvestNumberButtonView: View {
    var number: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundStyle(.seagull400)
                    .frame(
                        width: min(geometry.size.width, geometry.size.height) * 0.8,
                        height: min(geometry.size.width, geometry.size.height) * 0.8
                    )
                Text("1")
                    .foregroundStyle(.mineShaft50)
                    .fontWeight(.bold)
                    .font(.system(size: min(geometry.size.width, geometry.size.height) * 0.4))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}


#Preview {
    HanvestNumberButtonView()
}
