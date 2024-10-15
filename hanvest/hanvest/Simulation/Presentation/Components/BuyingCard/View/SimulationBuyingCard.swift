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
                    
                    HanvestNumberStepper(value: $viewModel.stockPrice, raise: $priceRaise)
                    
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
    @Previewable @State var balance = 5300000
    @Previewable @State var price = 5300
    
    VStack {
        SimulationBuyingCard(viewModel: viewmodel)
            .onAppear(){
                viewmodel.setup(tradingBalance: balance, stockPrice: price)
            }
            .onChange(of: balance) { oldValue, newValue in
                viewmodel.tradingBalance = newValue
            }
            .onChange(of: price) { oldValue, newValue in
                viewmodel.stockPrice = newValue
            }
        
        HStack {
            HanvestButtonDefault(
                style: .filledCorrect(isDisabled: false),
                title: "Increment Balance") {
                balance += 100
            }
            HanvestButtonDefault(
                style: .filledIncorrect(isDisabled: false),
                title: "Decrement Balance") {
                    if balance >= 5300000 + 100 {
                        balance -= 100
                    }
            }
        }
    }
    .padding(.horizontal, 16)
}
