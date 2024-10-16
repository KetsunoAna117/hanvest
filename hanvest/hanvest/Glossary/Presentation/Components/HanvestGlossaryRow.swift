//
//  HanvestGlossaryRow.swift
//  hanvest
//
//  Created by Christian Gunawan on 16/10/24.
//

import SwiftUI

struct HanvestGlossaryRow: View {
    var letter: String
    var words: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            HanvestGlossaryWordLetterRow(letter: letter)
            ForEach(words, id: \.self) { word in
                HanvestGlossaryWordRow(words: word) { clickedWord in
                    print("\(clickedWord) clicked")
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    HanvestGlossaryRow(letter: "C", words: ["Cash", "Cashflow", "Cashflows"])
}
