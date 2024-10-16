//  GlosaryList.swift
//  hanvest
//
//  Created by Christian Gunawan on 16/10/24.
//

import SwiftUI

struct HanvestGlossaryListComponent: View {
    @ObservedObject var viewModel: GlosaryWordLetterViewModel
    
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
    @Previewable @State var viewmodel = GlosaryWordLetterViewModel()
    HanvestGlossaryListComponent(viewModel: viewmodel)
}
