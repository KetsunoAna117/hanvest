//
//  HanvestSimulationNewsScreenView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import SwiftUI

struct HanvestSimulationNewsScreenView: View {
    let router: any AppRouterProtocol
    @StateObject private var viewmodel = HanvestNewsSimulationViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                
            }
            
            if viewmodel.newsList.count != 0 {
                ScrollView {
                    VStack {
                        ForEach(viewmodel.newsList, id: \.newsID) { news in
                            HanvestNewsButton(
                                news: news,
                                action: {
                                    print("Navigating to: \(news.newsTitle)")
                                }
                            )
                        }
                    }
                }
                HanvestButtonDefault(title: "Back", action: {
                    router.pop()
                })
            }
            else {
                Text("No News Available")
            }
        }
        .padding(.horizontal, 20)
        .onAppear(){
            viewmodel.setup()
        }
    }
}
