//
//  HanvestNumberStepper.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

struct HanvestNumberStepper: View {
    @Binding var value: Int
    @StateObject var viewModel = HanvestNumberStepperViewModel()
    
    var body: some View {
        HStack(spacing: 56) {
            Button{
                viewModel.increment(&value)
            }label: {
                Circle()
                    .frame(width: 28, height: 28)
                    .foregroundStyle(.seagull100)
                    .overlay{
                        Image(systemName: "plus")
                            .frame(width: 17, height: 17)
                            .foregroundColor(.black)
                            .padding()
                    }
                
            }
            
            Text("\(value)")
                .font(.title)
                .padding(.horizontal)
            
            Button {
                viewModel.decrement(&value)
            }label: {
                Circle()
                    .frame(width: 28, height: 28)
                    .foregroundStyle(.seagull100)
                    .overlay{
                        Image(systemName: "minus")
                            .frame(width: 17, height: 17)
                            .foregroundColor(.black)
                            .padding()
                    }
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var value: Int = 0
    
    VStack {
        HanvestNumberStepper(value: $value)
    }
    .background(.mineShaft50)
    .frame(maxWidth: .infinity)
}

