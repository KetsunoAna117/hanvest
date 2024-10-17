//
//  SearchViewModel.swift
//  hanvest
//
//  Created by Christian Gunawan on 17/10/24.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searchString: String = "" {
        didSet {
            search()
        }
    }
    
    @Published var filteredResults: [HanvestGlosaryEntities] = []
    @Published var recentSearches: [HanvestGlosaryEntities] = []

    private var viewModel: GlossaryViewModel
    private var allEntities: [HanvestGlosaryEntities] {
        viewModel.letters.values.flatMap { $0 }
    }
    
    init(viewModel: GlossaryViewModel) {
        self.viewModel = viewModel
        self.filteredResults = allEntities
    }
    
    func search() {
        if searchString.isEmpty {
            filteredResults = []
        } else {
            filteredResults = allEntities.filter { $0.word.lowercased().contains(searchString.lowercased()) }
        }
    }

    func addToRecentSearches(_ entity: HanvestGlosaryEntities) {
        if !recentSearches.contains(where: { $0.word == entity.word }) {
            recentSearches.insert(entity, at: 0)
        }
    }

    func cancelSearch() {
        searchString = ""
        filteredResults = []
    }
}
