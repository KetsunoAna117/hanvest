//
//  SimulationSellingCard.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 15/10/24.
//

import SwiftUI

struct SimulationSellingCard: View {
    @ObservedObject var viewModel: SellingStockDataViewModel
    @State var priceRaise: Int = 25
    @State var lotRaise: Int = 1
    
    var body: some View {
        HanvestCardBackground {
            VStack(spacing: 16) {
                HStack{
                    Text("Lot Available")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    Text("\(viewModel.availableLot)")
                        .font(.nunito(.body, .bold))
                }
                
                HStack{
                    HanvestSlider(value: $viewModel.stockSellLot, minimum: 0, maximum: viewModel.maximumStockSellLot())
                    
                    Spacer()
                    
                    Text("\(viewModel.calculateStockSellAmountPercentage()) %")
                        .font(.nunito(.body, .regular))
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
                    
                    HanvestNumberStepper(value: $viewModel.stockPrice, raise: $priceRaise)
                    
                }
                
                HStack{
                    Text("Lot")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    HanvestNumberStepper(value: $viewModel.stockSellLot, raise: $lotRaise)
                }
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var viewmodel = SellingStockDataViewModel()
    @Previewable @State var remainingLot = 10
    @Previewable @State var price = 100
    
    VStack {
        SimulationSellingCard(viewModel: viewmodel)
            .onAppear(){
                viewmodel.setup(availableLot: remainingLot, stockPrice: price)
            }
            .onChange(of: remainingLot) { oldValue, newValue in
                viewmodel.availableLot = newValue
            }
            .onChange(of: price) { oldValue, newValue in
                viewmodel.stockPrice = newValue
            }
        
        HStack {
            HanvestButtonDefault(
                style: .filledCorrect(isDisabled: false),
                title: "Increment Lot") {
                    remainingLot += 100
            }
            HanvestButtonDefault(
                style: .filledIncorrect(isDisabled: false),
                title: "Decrement Lot") {
                    if remainingLot >= 5300000 + 100 {
                        remainingLot -= 100
                    }
            }
        }
    }
    .padding(.horizontal, 16)
}
