//
//  UserDataCardView.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 17/10/24.
//

import SwiftUI

struct UserDataCardView: View {
    @ObservedObject var viewModel: UserDataCardViewModel
    
    @State private var isEditingName: Bool = false
    @State private var newUserName: String = ""
    
    var body: some View {
        let labelState = viewModel.determineLabelState()
        
        HanvestCardBackground{
            VStack(spacing: 16) {
                Circle()
                    .fill(.seagull500)
                    .frame(width: 142, height: 142)
                    .overlay{
                        Image("person-icon")
                            .resizable()
                            .frame(width: 63, height: 63)
                            .foregroundStyle(.mineShaft50)
                    }
                    .background(
                        Circle()
                            .stroke(.mineShaft200, lineWidth: 1)
                    )
                
                HStack(spacing: 12) {
                    if isEditingName {
                        TextField("\(viewModel.username)", text: $newUserName)
                            .padding()
                            .frame(width: 250, height: 42)
                            .font(.nunito(.title1, .regular))
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.fillSecondary, lineWidth: 1)
                            )
                    } else {
                        Text(viewModel.username)
                            .font(.nunito(.largeTitle, .bold))
                    }
                    
                    Button {
                            if isEditingName {
                                viewModel.username = newUserName
                            }
                            isEditingName.toggle()
                    } label: {
                        Image(systemName: isEditingName ? "checkmark" : "pencil")
                            .resizable()
                            .frame(width: 16, height: 18)
                            .foregroundColor(isEditingName ? .mineShaft50 : .black)
                            .background(
                                Circle()
                                    .fill(isEditingName ? .blizzardBlue400 : .clear)
                                    .frame(width: 30, height: 30)
                            )
                    }
                }
                
                HStack {
                    
                    
                    Text(viewModel.riskProfileStatus.riskHeaderText)
                        .font(.nunito(.body, .regular))
                    
                    
                }
                
                HanvestProgressBar(value: $viewModel.percentage, minimum: 0, maximum: 100)
                    .frame(height: 10)
                
                
                Text("\(HanvestPriceFormatter.formatIntToIDR(viewModel.todayEquity)) (\(labelState.symbolType)\(viewModel.percentage)%)")
            }
            .padding()
        }
    }
}

#Preview {
    @Previewable @StateObject var viewModel = UserDataCardViewModel()
    
    VStack {
        UserDataCardView(viewModel: viewModel)
            .onAppear(){
                viewModel.setup(
                    todayEquity: 70000,
                    yesterdayEquity: 55000
                )
            }
    }
    .padding(.horizontal, 16)
}
