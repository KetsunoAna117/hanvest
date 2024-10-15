//
//  SimulationBuyingCard.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 14/10/24.
//

import SwiftUI

struct SimulationBuyingCard: View {
    @StateObject var viewModel: BuyingStockDataViewModel
    @State var priceRaise: Int = 25
    @State var lotRaise: Int = 1
    
    var body: some View {
        HanvestCardBackground {
            VStack(spacing: 16) {
                HStack{
                    Text("Trading Balance")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    Text("\(HanvestPriceFormatter.formatIntToIDR(viewModel.tradingBalance))")
                        .font(.nunito(.body, .bold))
                }
                
                HStack{
                    HanvestSlider(value: $viewModel.stockBuyLot, minimum: 0, maximum: viewModel.maximumStockBuyLot())
                    
                    Spacer()
                    
                    
                    Text("\(viewModel.calculateStockBuyAmountPercentage()) %")
                        .font(.nunito(.body, .regular))
                }
                
                HStack{
                    Text("Amount")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    Text("\(HanvestPriceFormatter.formatIntToIDR(viewModel.stockBuyAmount))")
                        .font(.nunito(.body, .regular))
                }
                
                HStack{
                    Text("Price")
                        .font(.nunito(.body, .regular))
                        
                    Spacer()
                        .padding(.horizontal)
                    
                    VStack{
                        HanvestNumberStepper(value: $viewModel.stockPrice, raise: $priceRaise)
                    }
                    
                }
                
                
                HStack{
                    Text("Lot")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                        .padding(.horizontal)
                    
                    VStack{
                        HanvestNumberStepper(value: $viewModel.stockBuyLot, raise: $lotRaise)
                    }
                }
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var balance = 5300000
    @Previewable @State var price = 5300
    
    SimulationBuyingCard(viewModel: BuyingStockDataViewModel(tradingBalance: balance, stockPrice: price))
}
