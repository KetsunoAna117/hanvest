//
//  SimulationSellingCard.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 15/10/24.
//

import SwiftUI

struct SimulationSellingCard: View {
    @ObservedObject var viewModel: SellingStockDataViewModel
    
    // Constant
    var priceRaise: Int = 25
    var lotRaise: Int = 1
    
    var body: some View {
        let amountState = viewModel.determineAmountState()
        
        HanvestCardBackground {
            VStack(spacing: 16) {
                HStack{
                    Text("Lot Available")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    Text("\(viewModel.availableLot)")
                        .font(.nunito(.body, .bold))
                        .foregroundStyle(amountState.textColor)
                }
                
                HStack{
                    HanvestSlider(value: $viewModel.stockSellLot, minimum: 0, maximum: viewModel.maximumStockSellLot())
                    
                    Spacer()
                    
                    Text("\(viewModel.calculateStockSellAmountPercentage()) %")
                        .font(.nunito(.body, .regular))
                        .foregroundStyle(amountState.textColor)
                }
                
                HStack{
                    Text("Amount")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    Text("\(HanvestPriceFormatter.formatIntToIDR(viewModel.stockSellAmount))")
                        .font(.nunito(.body, .regular))
                }
                
                HStack{
                    Text("Price")
                        .font(.nunito(.body, .regular))
                        
                    Spacer()
                    
                    HanvestNumberStepper(value: $viewModel.toSellStockPrice, raise: priceRaise)
                    
                }
                
                HStack{
                    Text("Lot")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    HanvestNumberStepper(value: $viewModel.stockSellLot, raise: lotRaise)
                }
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var viewmodel = SellingStockDataViewModel()
    
    VStack {
        SimulationSellingCard(viewModel: viewmodel)
            .onAppear(){
                viewmodel.setup(
                    selectedStockIDName: "BBRI",
                    initialStockPrice: 4000,
                    currentStockPrice: 5000
                )
            }
    }
    .padding(.horizontal, 16)
}
