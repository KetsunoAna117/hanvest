//
//  HanvestCategoryButton.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 17/10/24.
//

import SwiftUI

struct HanvestCategoryButton: View {
    // Constant
    let SHADOW_OFFSET: CGFloat = 5
    let WIDTH: CGFloat = 40
    let HEIGHT: CGFloat = 40
    
    // Bind to the parent selection
    @Binding var selectedStockID: String
    
    // Styling Variable (Initialized Before)
    var initialState: HanvestCategoryButtonDefaultState
    
    @State private var state: HanvestCategoryButtonDefaultState = .unselected
    
    // Button Content
    var id: String
    var imageName: String
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.seagull500)
                .frame(maxWidth: WIDTH, maxHeight: HEIGHT)
                .shadow(
                    color: (self.state == .unselected ? .seagull600 : .clear),
                    radius: getPressedStatus() ? 0 : 0, x: 0, y: getPressedStatus() ? 0 : SHADOW_OFFSET
                )
                .overlay{
                    Image("\(imageName)")
                }
                .offset(y: getPressedStatus() ? SHADOW_OFFSET : 0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
                .onTapGesture {
                    if selectedStockID != id {
                        self.selectedStockID = self.id
                        state = .selected
                        action()
                    }
                }
                .onChange(of: selectedStockID) { oldValue, newValue in
                    if newValue != id {
                        state = .unselected
                    }
                }
                .onAppear(){
                    state = initialState
                }
        }
    }
    
    func getPressedStatus() -> Bool {
        return state == .selected
    }
    
}

#Preview {
    @Previewable @State var selectedStockOption: String = ""
    
    VStack {
        HanvestCategoryButton(
            selectedStockID: $selectedStockOption,
            initialState: .unselected,
            id: "Stock-1",
            imageName: "star-logo"
        ) {
            print("Stock-1 selected")
        }
        
        HanvestCategoryButton(
            selectedStockID: $selectedStockOption,
            initialState: .unselected,
            id: "Stock-2",
            imageName: "jacket-logo"
        ) {
            print("Stock-2 selected")
        }
        
        HanvestCategoryButton(
            selectedStockID: $selectedStockOption,
            initialState: .unselected,
            id: "Stock-3",
            imageName: "short-logo"
        ) {
            print("Stock-3 selected")
        }
        
        HanvestCategoryButton(
            selectedStockID: $selectedStockOption,
            initialState: .unselected,
            id: "Stock-4",
            imageName: "lipstick-logo"
        ) {
            print("Stock-4 selected")
        }
        
        HanvestCategoryButton(
            selectedStockID: $selectedStockOption,
            initialState: .unselected,
            id: "Stock-5",
            imageName: "beanie-logo"
        ) {
            print("Stock-5 selected")
        }
        
        HanvestCategoryButton(
            selectedStockID: $selectedStockOption,
            initialState: .unselected,
            id: "Stock-6",
            imageName: "shoe-logo"
        ) {
            print("Stock-6 selected")
        }
        
        HanvestCategoryButton(
            selectedStockID: $selectedStockOption,
            initialState: .unselected,
            id: "Stock-7",
            imageName: "ring-logo"
        ) {
            print("Stock-7 selected")
        }
    }
}
