//  GlosaryList.swift
//  hanvest
//
//  Created by Christian Gunawan on 16/10/24.
//

import SwiftUI

struct GlosaryList: View {
  @StateObject private var viewModel = GlosaryWordLetterViewModel()

  var body: some View {
    ScrollView {
      ForEach(viewModel.alphabet, id: \.self) { letter in
        if let words = viewModel.letters[letter], !words.isEmpty {
          HanvestGlossaryRow(
            letter: letter,
            words: words
          )
        }
      }
    }
    .padding()
  }
}

#Preview {
  GlosaryList()
}
