//
//  HanvestGlossaryWordLetterRow.swift
//  hanvest
//
//  Created by Christian Gunawan on 16/10/24.
//

import SwiftUI

struct HanvestGlossaryWordLetterRow: View {
  var letter: String

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text("\(letter)")
        .font(.nunito(.title3))
        .fontWeight(.bold)
        .frame(alignment: .topLeading)
      Divider()
    }
    .frame(maxWidth: .infinity, alignment: .topLeading)
  }
}

#Preview {
  HanvestGlossaryWordLetterRow(letter: "A")
}
