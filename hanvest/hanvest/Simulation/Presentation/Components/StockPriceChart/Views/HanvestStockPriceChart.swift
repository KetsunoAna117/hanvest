//
//  HanvestStockPriceChart.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/10/24.
//

import SwiftUI
import Charts

struct HanvestStockPriceChart: View {
    @ObservedObject var viewmodel: HanvestStockPriceChartViewModel
    let symbolCategoryKeyPath: KeyPath<SimulationStockPriceEntity, String> // Category to differentiate symbols
    
    var body: some View {
        HanvestCardBackground {
            VStack {
                Chart {
                    ForEach(viewmodel.stockPrices, id: \.id) { price in
//                        AreaMark(
//                            x: .value("Time", price.time),
//                            y: .value("Price", price.stockPrice)
//                        )
//                        .foregroundStyle(Gradient(colors: [.seagull500.opacity(0.2), .clear])) // Gradient fill
//                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5) // Shadow on area fill
                        
                        LineMark(
                            x: .value("Time", price.time),
                            y: .value("Price", price.stockPrice)
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
                    AxisMarks(values: .stride(by: .hour, count: 1)) { value in
                        if value.as(Date.self) != nil {
                            AxisGridLine()
                            AxisTick()
                            AxisValueLabel(format: .dateTime.hour(), centered: true) // Format to display hours and minutes
                        }
                    }
                }
                // Set y-axis bounds using chartYScale
                .chartYScale(domain: viewmodel.lowerBound...viewmodel.upperBound)
                .chartYAxis {
                    AxisMarks(values: viewmodel.yAxisValues) {
                        value in
                        AxisGridLine()
                        AxisTick()
                        AxisValueLabel("\(value.as(Double.self)!, specifier: "%.0f")") // Display as integers
                    }
                }
                .chartXAxisLabel("Time (Hour)")
                .chartYAxisLabel("Price")
                .frame(height: 250)
//                .chartScrollableAxes(.horizontal)
//                .chartXVisibleDomain(length: viewmodel.timeRange / 2) // Adjust the length based on the time range
                
            }
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var stockPrices = SimulationStockEntity.getMockData().first!.stockPrice ?? []
    
    HanvestStockPriceChart(
        viewmodel: HanvestStockPriceChartViewModel(stockPrices: stockPrices), symbolCategoryKeyPath: \.stockIDName)
    .padding(.horizontal, 20)
}
