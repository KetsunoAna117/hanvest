//
//  HanvestModuleNumberButtonViewBuilder.swift
//  hanvest
//
//  Created by Bryan Vernanda on 09/10/24.
//

import SwiftUI

@ViewBuilder
func moduleNumberButtonViewBuilder(number: Int?, image: Image?) -> some View {
    if let image = image {
        image
    } else {
        Text("\(number ?? 0)")
    }
}
