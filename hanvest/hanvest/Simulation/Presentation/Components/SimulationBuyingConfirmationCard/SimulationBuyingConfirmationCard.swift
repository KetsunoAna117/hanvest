//
//  SimulationBuyingConfirmationCard.swift
//  hanvest
//
//  Created by Christian Gunawan on 15/10/24.
//

import SwiftUI

struct SimulationBuyingConfirmationCard: View {
    var viewModel: BuyingStockDataViewModel
    var body: some View {
        HanvestCardBackground {
            VStack(alignment: .center, spacing: 24){
                Text("Preview Buy Order").font(.nunito(.body))
                VStack(alignment: .leading, spacing: 12){
                    rowDes(title: "Stock", value: viewModel.stock.uppercased())
                    rowDes(title: "Price", value: "\(viewModel.priceStock)")
                    rowDes(title: "Fee", value: "\(viewModel.fee)")
                    rowDes(title: "Lot", value: "\(viewModel.lot)")
                    rowDes(title: "Amount", value: "\(viewModel.priceAmount)")
                    }
                HStack{
                    HanvestButtonDefault(
                        size: .medium,
                        style: .filledIncorrect(isDisabled: false),
                        iconPosition: .leading,
                        title: "Cancel",
                        action: {
                            print("Button Pressed!")
                        }
                    )
                    HanvestButtonDefault(
                        size: .medium,
                        style: .filledCorrect(isDisabled: false),
                        iconPosition: .leading,
                        title: "Confirm",
                        action: {
                            print("Button Pressed!")
                        }
                    )
                }
           
            }.padding(16)
            
        }
        }
    func rowDes(title: String, value: String) -> some View {
        HStack(alignment: .center, spacing: 24) {
            Text(title)
                .font(.nunito(.body))
                .frame(width: 120, alignment: .topLeading)
            Text(value)
                .font(.nunito(.body))
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    
    }
    
#Preview {
    SimulationBuyingConfirmationCard(viewModel: BuyingStockDataViewModel(
        stock: "bbca",
        priceStock: 5000,
        lot: 1,
        fee: 500
        )
    )
    .padding(.horizontal, 16)
    }

