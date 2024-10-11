import SwiftUI

struct StockOption: View {
    
 
    static var currentID: String = "none"

    @State private var state: HanvestStockOptionDefaultState = .unpressed
    var style: HanvestingStockOptionStyle = .filled(isDisabled: false)
    var initialState: HanvestStockOptionDefaultState = .unpressed
    let SHADOW_OFFSET: CGFloat = 5
    let WIDTH: CGFloat = 75
    let HEIGHT: CGFloat = 75
    
    var id: String
    var image: Image?
    var action: () -> Void
    var color: Color
    var shadowColor: Color

    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .frame(width: WIDTH, height: HEIGHT)
                .cornerRadius(12)
                .shadow(
                    color: getInitialStatus() ? .clear : shadowColor,
                    radius: getInitialStatus() ? 0 : 0, x: 0, y: getPressedStatus() ? 0 : SHADOW_OFFSET
                )

            if let image = image {
                image
                    .foregroundStyle(getDisabledStatus() ? .labelTertiary : style.fontColor)
            }
        }
        .frame(maxWidth: WIDTH, maxHeight: HEIGHT)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(style.borderColor, lineWidth: 0.5)
        )
        .offset(y: getPressedStatus() ? SHADOW_OFFSET : 0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        .onTapGesture {
            if self.state != .disabled {
                StockOption.currentID = self.id
                print("\(id) pressed")
                action()
            }
        }
        .onLongPressGesture(minimumDuration: 0.1, pressing: { isPressing in
            withAnimation {
                if self.initialState == .unpressed {
                    self.state = isPressing ? .pressed : .pressed
                }
            }
        }, perform: {
            if self.state != .disabled {
                action()
            }
        })
        .onAppear {
            setupState()
        }
        .disabled(getDisabledStatus())
    }
    func getInitialStatus() -> Bool {
        return initialState == .pressed
    }
    
    func getPressedStatus() -> Bool {
        return state == .pressed
    }
    
    func getDisabledStatus() -> Bool {
        return state == .disabled
    }
    
    func setupState() {
        if StockOption.currentID != id {
            self.state = .unpressed
        } else {
            self.state = initialState
        }
        
        if style.isDisabled || initialState == .disabled {
            self.state = .disabled
        }
    }
}

#Preview {
    VStack {
        StockOption(
            style: .filled(isDisabled: false),
            initialState: .unpressed, id: "uniqueID1",
            image: Image(systemName: "star.fill"),
            action: {
                print("Button 1 pressed")
            },
            color: .blue, shadowColor: .gray
            
        )
        
        StockOption(
            style: .filled(isDisabled: false),
            initialState: .pressed,
            id: "uniqueID2",
            image: Image(systemName: "star.fill"),
            action: {
                print("Button 2 pressed")
            },
            color: .red, shadowColor: .gray
        )
        StockOption(
            style: .filled(isDisabled: false),
            initialState: .unpressed,
            id: "uniqueID3",
            image: Image(systemName: "star.fill"),
            action: {
                print("Button 3 pressed")
            },
            color: .green, shadowColor: .gray
        )
        StockOption(
            style: .filled(isDisabled: false),
            initialState: .unpressed,
            id: "uniqueID4",
            image: Image(systemName: "star.fill"),
            action: {
                print("Button 4 pressed")
            },
            color: .yellow, shadowColor: .gray
        )
    }
}
