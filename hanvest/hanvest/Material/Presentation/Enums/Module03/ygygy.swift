//
//  ygygy.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct BulletedListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(bulletPoints, id: \.self) { bulletPoint in
                HStack(alignment: .top) {
                    Text("•") // Unicode bullet point character
                        .fontWeight(.semibold)
                    
                    Text(bulletPoint)
                }
            }
        }
        .padding()
    }

    // Example data for the bulleted list
    private let bulletPoints = [
        "Item 1",
        "Item 2",
        "Item 3",
        "Item 4"
    ]
}

struct BulletedListView_Previews: PreviewProvider {
    static var previews: some View {
        BulletedListView()
    }
}
