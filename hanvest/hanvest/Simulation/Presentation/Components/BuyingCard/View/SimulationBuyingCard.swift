//
//  SimulationBuyingCard.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 14/10/24.
//

import SwiftUI

struct SimulationBuyingCard: View {
    @ObservedObject var viewModel: BuyingStockDataViewModel
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
                    
                    HanvestNumberStepper(value: $viewModel.toBuyStockPrice, raise: $priceRaise)
                    
                }
                
                
                
                HStack{
                    Text("Lot")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    HanvestNumberStepper(value: $viewModel.stockBuyLot, raise: $lotRaise)
                }
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var viewmodel = BuyingStockDataViewModel()
    
    VStack {
        SimulationBuyingCard(viewModel: viewmodel)
            .onAppear(){
                viewmodel.setup(
                    initialStockPrice: 4000,
                    currentStockPrice: 5000
                )
            }
    }
    .padding(.horizontal, 16)
}
