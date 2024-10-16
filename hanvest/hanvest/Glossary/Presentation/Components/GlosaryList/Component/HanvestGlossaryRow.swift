//
//  HanvestGlossaryRow.swift
//  hanvest
//
//  Created by Christian Gunawan on 16/10/24.
//

import SwiftUI

struct HanvestGlossaryRow: View {
  var letter: String
  var words: [HanvestGlosaryEntities]

  var body: some View {
    VStack(alignment: .leading) {
      HanvestGlossaryWordLetterRow(letter: letter)
      ForEach(words, id: \.word) { entry in
        HanvestGlossaryWordRow(entity: entry) { clickedEntity in
          print("\(clickedEntity.word) clicked: \(clickedEntity.description)")
        }
      }
    }
    .padding(8)
  }
}

#Preview {
  HanvestGlossaryRow(
    letter: "A",
    words: [
      HanvestGlosaryEntities(word: "Cash", description: "Duit"),
      HanvestGlosaryEntities(word: "Cuy", description: "Cuy"),
    ]
  )
}

#Preview {
  HanvestGlossaryRow(
    letter: "A",
    words: [
      HanvestGlosaryEntities(
        word: "Cash",
        description: "Duit"
      ),
      HanvestGlosaryEntities(
        word: "Cuy",
        description: "Cuy"
      ),
    ]
  )

}
