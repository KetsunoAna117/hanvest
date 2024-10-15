//
//  SimulationBuyingCard.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 14/10/24.
//

import SwiftUI

struct SimulationBuyingCard: View {
    @StateObject var viewModel: BuyingStockDataViewModel
    
    var body: some View {
        HanvestCardBackground {
            VStack(spacing: 16) {
                HStack {
                    Text("Trading Balance")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    //                        Text("Rp \(viewModel.tradingBalance)")
                    Text("Rp \(viewModel.tradingBalance)")
                        .font(.nunito(.body, .bold))
                }
                
                
                
                HStack {
                    HanvestSlider(value: $viewModel.stockBuyLot, minimum: 0, maximum: viewModel.maximumStockBuyLot())
                    
                    Spacer()
                    
                    Text("\(viewModel.calculateStockBuyAmountPercentage()) %")
                        .font(.nunito(.body, .regular))
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("Amount")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    Text("Rp \(viewModel.stockBuyAmount)")
                        .font(.nunito(.body, .bold))
                }
                
                HStack {
                    Text("Price")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    VStack{
                        HanvestNumberStepper(value: $viewModel.stockPrice)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                HStack {
                    Text("Lot")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    VStack{
                        HanvestNumberStepper(value: $viewModel.stockBuyLot)
                    }
                    .frame(maxWidth: .infinity)
                    
                }
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var balance = 1000000
    @Previewable @State var price = 500
    
    SimulationBuyingCard(viewModel: BuyingStockDataViewModel(tradingBalance: balance, stockPrice: price))
}
