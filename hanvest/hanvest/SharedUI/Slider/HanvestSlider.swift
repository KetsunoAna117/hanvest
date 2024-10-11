//
//  HanvestSlider.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 11/10/24.
//

import SwiftUI

struct HanvestSlider: View {
    @Binding var value: Double
    var minimum: Double
    var maximum: Double
    
    var body: some View {
        VStack {
            Slider(value: $value, in: minimum...maximum)
                .frame(width: 280, height: 4)
                .tint(.seagull400)
                .padding()
        }
    }
}

#Preview {
    @Previewable @State var value : Double = 30

    VStack {
        HanvestSlider(value: $value, minimum: 0, maximum: 100)
                    .padding()
        
        Text("Value: \(Int(value))")
    }
    .padding(.horizontal, 16)
}
