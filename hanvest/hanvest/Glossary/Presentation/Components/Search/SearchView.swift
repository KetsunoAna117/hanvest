//
//  SearchView.swift
//  hanvest
//
//  Created by Christian Gunawan on 17/10/24.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if viewModel.searchString.isEmpty {
                    Text("Recent")
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                    ForEach(viewModel.recentSearches, id: \.word) { entity in
                        HanvestGlossaryWordRow(entity: entity) { selectedEntity in
                            print("\(selectedEntity.word) clicked: \(selectedEntity.description)")
                        }
                    }
                } else {
                    ForEach(viewModel.filteredResults, id: \.word) { entity in
                        HanvestGlossaryWordRow(entity: entity) { selectedEntity in
                            print("\(selectedEntity.word) clicked: \(selectedEntity.description)")
                            viewModel.addToRecentSearches(selectedEntity)
                        }
                    }
                }
            }
            .padding()
        }
        .searchable(text: $viewModel.searchString)
    }
}

#Preview {
    NavigationStack {
        SearchView(viewModel: SearchViewModel(viewModel: GlossaryViewModel()))
    }
}
