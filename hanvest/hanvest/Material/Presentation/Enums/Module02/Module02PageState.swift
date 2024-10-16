//
//  Module02PageState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

enum Module02PageState: CaseIterable {
    case page01
    case page02
    case page03
    case page04
    case page05
    case page06
    case page07
    case page08
    case page09
    case page08Alt2
    case page09Alt2
    case page10
    case claimRewardPage
    
    var buttonStringValue: String {
        switch self {
            case .page01, .page02, .page03:
                return "Buy"
            case .page04, .page05, .page06:
                return "Checkout"
            case .page07:
                return "Pay"
            case .page08, .page09, .page08Alt2, .page09Alt2, .page10:
                return "Continue"
            case .claimRewardPage:
                return "Claim Reward"
        }
    }
    
    var page04Text: String? {
        switch self {
            case .page04:
                "Now choose the color you want"
            case .page01, .page02, .page03, .page05, .page06, .page07, .page08, .page09, .page08Alt2, .page09Alt2, .page10, .claimRewardPage:
                nil
        }
    }
    
    var page07Text: (headerText: String, choices: [String])? {
        switch self {
        case .page07:
            (
                "Now it's time for you to pay, choose wisely your payment method",
                ["Pay with Debit Card (Rp 24.999.000)", "Pay with PayLater (Rp 24.999.000)"]
            )
        case .page01, .page02, .page03, .page04, .page05, .page06, .page08, .page09, .page08Alt2, .page09Alt2, .page10, .claimRewardPage:
            nil
        }
    }
    
    var page10Text: (headerText: Text, detailText: Text)? {
        switch self {
            case .page10:
            (
                Text("In summary\n").font(.nunito(.title2, .bold)) +
                Text("Liabilities vs Assets").font(.nunito(.title2)),
                
                Text("Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities). Having a healthy balance sheet, where assets exceed liabilities, is one of the foundations of financial success.\n\n").font(.nunito(.callout)) +
                Text("Reference").font(.nunito(.callout, .bold)) +
                Text("Ross, S. A., Westerfield, R. W., & Jaffe, J. (2013). Corporate Finance. McGraw-Hill Education.").font(.nunito(.callout))
            )
            case .page01, .page02, .page03, .page04, .page05, .page06, .page07, .page08, .page09, .page08Alt2, .page09Alt2, .claimRewardPage:
                nil
        }
    }

}
