//
//  Simulation.swift
//  hanvest
//
//  Created by Christian Gunawan on 16/10/24.
//

import SwiftUI

struct SimulationSellingConfirmationCard: View {
    var viewModel: SellingStockDataConfirmationViewModel
    var cancelAction: () -> ()
    var confirmAction: () -> ()
    
    var body: some View {
        HanvestCardBackground {
            VStack(alignment: .center, spacing: 24){
                Text("Preview Sell Order").font(.nunito(.body))
                VStack(alignment: .leading, spacing: 12){
                    ConfirmationRow(title: "Stock", value: viewModel.stock.uppercased())
                    ConfirmationRow(title: "Price", value: "\(HanvestPriceFormatter.formatIntToIDR(viewModel.priceStock))")
                    ConfirmationRow(title: "Fee", value: "\(HanvestPriceFormatter.formatIntToIDR(viewModel.fee))")
                    ConfirmationRow(title: "Lot", value: "\(viewModel.lot)")
                    ConfirmationRow(title: "Amount", value: "\(HanvestPriceFormatter.formatIntToIDR(viewModel.priceAmount))")
                }
                HStack{
                    HanvestButtonDefault(
                        size: .medium,
                        style: .filledIncorrect(isDisabled: false),
                        iconPosition: .leading,
                        title: "Cancel",
                        action: cancelAction
                    )
                    HanvestButtonDefault(
                        size: .medium,
                        style: .filledCorrect(isDisabled: false),
                        iconPosition: .leading,
                        title: "Confirm",
                        action: confirmAction
                    )
                }
            }
            .padding(16)
        }
    }
}

#Preview {
    SimulationSellingConfirmationCard(
        viewModel:
            SellingStockDataConfirmationViewModel(
                stock: "BBCA",
                priceStock: 5000,
                lot: 1,
                fee: 500
            ), cancelAction: {
                print("Cancel button pressed")
            }, confirmAction: {
                print("Confirm button pressed")
            })
    .padding(.horizontal, 16)
}

