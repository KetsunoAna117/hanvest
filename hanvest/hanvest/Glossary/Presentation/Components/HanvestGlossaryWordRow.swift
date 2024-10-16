//
//  HanvestGlossaryWordRow.swift
//  hanvest
//
//  Created by Christian Gunawan on 16/10/24.
//

import SwiftUI

struct HanvestGlossaryWordRow: View {
    var words: String
    var action: (_ words: String) -> ()
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(words)")
                .font(.nunito(.body))
                .fontWeight(.medium)
                .frame(alignment: .topLeading)
            Divider()
        }
        .onTapGesture {
            action(words)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    HanvestGlossaryWordRow(words: "Cash") { words in
        print("\(words) clicked")
    }
}
