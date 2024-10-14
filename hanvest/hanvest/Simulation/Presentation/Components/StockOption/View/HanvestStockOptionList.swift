//
//  HanvestStockOptionList.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/10/24.
//

import SwiftUI

struct HanvestStockOptionList: View {
    @Binding var selectedStockID: String
    
    var simulationStockList: [SimulationStockEntity]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(simulationStockList, id: \.stockIDName) { stock in
                        HanvestStockOption(
                            selectedStockID: $selectedStockID,
                            initialState: self.selectedStockID == stock.stockIDName ? .selected : .unselected,
                            id: stock.stockIDName,
                            image: Image(systemName: "star"),
                            color: stock.stockImageColor) {
                                print("\(stock.stockName) is pressed")
                            }
                            .padding(.bottom, 6)
                    }
                }
            }
            .safeAreaPadding(.horizontal, 20)
        }
        .padding(.vertical, 12)
    }
}

#Preview {
    @Previewable @State var selectedStockID: String = "BBRI"
    
    HanvestStockOptionList(
        selectedStockID: $selectedStockID,
        simulationStockList: SimulationStockEntity.getMockData()
    )
}
