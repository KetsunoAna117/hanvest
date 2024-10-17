//
//  HanvestModule03ProductOfInvestmentChart.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import SwiftUI
import Charts

struct HanvestModule03ProductOfInvestmentChart: View {
    @ObservedObject var viewmodel: HanvestModule03ProductOfInvestmentViewModel
    let symbolCategoryKeyPath: KeyPath<Module03ProductOfInvestmentPriceEntity, String> // Category to differentiate symbols
    
    var displayBy: Calendar.Component
    var displayStep: Int = 1
    
    var body: some View {
        HanvestCardBackground {
            VStack {
                Chart {
                    ForEach(viewmodel.productPrices, id: \.id) { price in
                        LineMark(
                            x: .value("Time", price.time),
                            y: .value("Price", price.productPrice)
                        )
                        .symbol(symbol: {
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundStyle(.seagull500)
                        })
                        .foregroundStyle(.seagull500)
                    }
                }
                .chartXAxis {
                    AxisMarks(values: .stride(by: displayBy, count: displayStep)) { value in
                        if value.as(Date.self) != nil {
                            AxisGridLine()
                            AxisTick()
                            AxisValueLabel(format: .dateTime.month().day(), centered: true) // Display month/day
                        }
                    }
                }
                .chartYScale(domain: viewmodel.lowerBound...viewmodel.upperBound)
                .chartYAxis {
                    AxisMarks(values: viewmodel.yAxisValues) { value in
                        AxisGridLine()
                        AxisTick()
                        AxisValueLabel("\(value.as(Double.self)!, specifier: "%.0f")") // Display as integers
                    }
                }
                .chartXAxisLabel("Time (Days)")
                .chartYAxisLabel("Price")
                .frame(height: 250)
            }
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var productPrices = Module03ProductOfInvestmentEntity.getMockData().first!.productPrices
    
    HanvestModule03ProductOfInvestmentChart(
        viewmodel: HanvestModule03ProductOfInvestmentViewModel(productPrices: productPrices),
        symbolCategoryKeyPath: \.productName,
        displayBy: .day
    )
    .padding(.horizontal, 20)
}
