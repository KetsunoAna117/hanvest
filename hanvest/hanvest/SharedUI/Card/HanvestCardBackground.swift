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
