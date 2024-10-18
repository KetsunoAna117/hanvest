//
//  Module02HeaderWithDetailText.swift
//  hanvest
//
//  Created by Bryan Vernanda on 16/10/24.
//

import SwiftUI

enum Module02HeaderWithDetailText: Int, CaseIterable {
    case page08 = 7
    case page09 = 8
    case page08Alt2 = 70
    case page09Alt2 = 80
    case page10 = 9
    
    func title(userSelectedAnswer: String) -> Text {
        switch self {
            case .page08:
                congratulationText() + allAssetText(userSelectedAnswer: userSelectedAnswer)
            case .page09:
                whatIfText() + liabilitiesText(userSelectedAnswer: userSelectedAnswer)
            case .page08Alt2:
                congratulationText() + liabilitiesText(userSelectedAnswer: userSelectedAnswer)
            case .page09Alt2:
                whatIfText() + allAssetText(userSelectedAnswer: userSelectedAnswer)
            case .page10:
                Text("In summary\n").font(.nunito(.title2, .bold)) + Text("Liabilities vs Assets").font(.nunito(.title2))
        }
    }
    
    func detailText(userSelectedAnswer: String) -> Text {
        switch self {
            case .page08, .page09Alt2:
                Text("If you choose to pay with your ").font(.nunito(.callout)) +
                Text("debit card").font(.nunito(.callout, .bold)) +
                Text(", you're using your own money upfront. The cash is taken from your bank account immediately, and you get the \(normalOrProMax(userSelectedAnswer: userSelectedAnswer)) with no strings attached. There are no future payments or debts to worry about. It's a clear and simple exchange: you trade your cash").font(.nunito(.callout)) +
                Text(" (asset) ").font(.nunito(.callout, .bold)) +
                Text("for the iPhone").font(.nunito(.callout)) +
                Text(" (another asset) ").font(.nunito(.callout, .bold)) +
                Text(", and you're done with the transaction.").font(.nunito(.callout))
            case .page09, .page08Alt2:
                Text("If you buy the \(normalOrProMax(userSelectedAnswer: userSelectedAnswer)) using ").font(.nunito(.callout)) +
                Text("Pay Later").font(.nunito(.callout, .bold)) +
                Text(", you’re taking on a ").font(.nunito(.callout)) +
                Text("liability").font(.nunito(.callout, .bold)) +
                Text(". You get the iPhone now, but you owe Amazon the purchase price, which you'll have to repay in installments or by a specific date. Until the debt is fully paid off, this").font(.nunito(.callout)) +
                Text(" liability ").font(.nunito(.callout, .bold)) +
                Text("is hanging over your head. You enjoy the iPhone now, but you're financially tied to making future payments.").font(.nunito(.callout))
            case .page10:
                Text("Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities). Having a healthy balance sheet, where assets exceed liabilities, is one of the foundations of financial success.\n\n").font(.nunito(.callout)) +
                Text("Reference").font(.nunito(.callout, .bold)) +
                Text(": Ross, S. A., Westerfield, R. W., & Jaffe, J. (2013). Corporate Finance. McGraw-Hill Education.").font(.nunito(.callout))
        }
    }
    
    private func congratulationText() -> Text {
        return Text("Congratulation!\n").font(.nunito(.title2, .bold))
    }
    private func whatIfText() -> Text {
        return Text("What if?\n").font(.nunito(.title2, .bold))
    }
    
    private func liabilitiesText(userSelectedAnswer: String) -> Text {
        return Text("You got your \(normalOrProMax(userSelectedAnswer: userSelectedAnswer)) with your liabilities").font(.nunito(.title2))
    }
    
    private func allAssetText(userSelectedAnswer: String) -> Text {
        return Text("You got your \(normalOrProMax(userSelectedAnswer: userSelectedAnswer)) with your assets").font(.nunito(.title2))
    }
    
    private func normalOrProMax(userSelectedAnswer: String) -> String {
        if userSelectedAnswer == Module02MultipleChoice.page03.options.first {
            return "iPhone 16"
        } else {
            return "iPhone 16 Pro"
        }
    }
}
