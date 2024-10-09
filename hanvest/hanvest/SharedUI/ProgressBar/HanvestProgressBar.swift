//
//  HanvestProgressBar.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 09/10/24.
//

import SwiftUI

struct HanvestProgressBar: View {
    @Binding var value: Int
    var maximum: Int
    var minimum: Int
    
    func calculateProgressPercentage() -> CGFloat {
            guard maximum > minimum else { return 0 }  
        let percentage = CGFloat(value - minimum) / CGFloat(maximum - minimum)
            return min(max(percentage, 0), 1)
        }
    
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 100)
                .frame(width: 280, height: 4)
                .foregroundStyle(.fillSecondary)
            
            RoundedRectangle(cornerRadius: 100)
                .frame(width: 280 * calculateProgressPercentage() , height: 4)
                .foregroundStyle(.seagull400)
                .animation(.easeInOut, value: value)
        }
    }
}

