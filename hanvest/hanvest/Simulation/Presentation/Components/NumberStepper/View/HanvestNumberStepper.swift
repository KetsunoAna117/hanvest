//
//  HanvestNumberStepper.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

struct HanvestNumberStepper: View {
    @Binding var value: Int
    @Binding var raise: Int
    @StateObject var viewModel = HanvestNumberStepperViewModel()
    
    var body: some View {
        HStack() {
            Button{
                viewModel.decrement(&value, &raise)
            }label: {
                Circle()
                    .stroke(.mineShaft200, lineWidth: 1)
                    .frame(width: 28, height: 28)
                    .background(
                        Circle()
                            .fill(.seagull100)
                    )
                    .overlay{
                        Image(systemName: "minus")
                            .frame(width: 17, height: 17)
                            .foregroundColor(.black)
                            .padding()
                    }
                
            }
            
            Text("\(value)")
                .font(.nunito(.body))
                .frame(minWidth: 80, idealWidth: 168) // Ideal width set here
                .padding(.horizontal, 20)
            
            Button {
                viewModel.increment(&value, &raise)
            }label: {
                Circle()
                    .stroke(.mineShaft200, lineWidth: 1)
                    .frame(width: 28, height: 28)
                    .background(
                        Circle()
                            .fill(.seagull100)
                    )
                    .overlay{
                        Image(systemName: "plus")
                            .frame(width: 17, height: 17)
                            .foregroundColor(.black)
                            .padding()
                    }
            }
        }
        .frame(minWidth: 168)
        .padding()
    }
}

#Preview {
    @Previewable @State var value: Int = 10
    @Previewable @State var raise: Int = 1000000
    
    VStack {
        HanvestNumberStepper(value: $value, raise: $raise)
    }
    .background(.mineShaft50)
}

