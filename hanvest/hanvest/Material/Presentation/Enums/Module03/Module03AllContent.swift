//
//  Module03AllContent.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import SwiftUI

enum Module03AllContent: Int, CaseIterable {
    case page01 = 0
    case page02 = 1
    case page03 = 2
    case page04 = 3
    case page05 = 4
    case page06 = 5
    
    var headerText: String {
        switch self {
            case .page01:
                "Buy 1 product of invesment"
            case .page02:
                "Welcome to day 31"
            case .page03:
                "Welcome to day 61"
            case .page04:
                "Welcome to day 91"
            case .page05, .page06:
                "What is the relationship between risk and return in investment?"
        }
    }
    
    var detailText: Text {
        switch self {
            case .page01:
                Text("Balance: Rp 10.000.000").font(.nunito(.callout))
            case .page02, .page03, .page04:
                Text("Equity: Rp 20.000.000").font(.nunito(.callout))
            case .page05:
                Text("Explanation").font(.nunito(.callout, .bold)) +
                Text(":\n• Deposits (Savings or Time Deposits): These are considered stable investments. Your principal is safe, and the return is steady but modest, much like a stable but low-interest savings account.\n• Bonds: Bonds have a moderate level of fluctuation. They can rise and fall in value, but the changes are generally smaller compared to stocks. The risk is low to moderate, and so is the return, but it's still more dynamic than a savings account.\n• Stocks: Stocks are the most volatile, with large price swings both up and down. The potential for high returns is significant, but there's also a greater chance of loss, making them the most fluid and unpredictable of the three.\nThis analogy shows how each investment carries different levels of risk and return, helping to explain their behavior and potential outcomes.\n\n").font(.nunito(.callout)) +
                Text("Reference").font(.nunito(.callout, .bold)) +
                Text(": Ross, S. A., Westerfield, R. W., & Jaffe, J. (2013). Corporate Finance. McGraw-Hill Education.").font(.nunito(.callout))
            case .page06:
                Text("Explanation").font(.nunito(.callout, .bold)) +
                Text(":\n• Deposits: The return is steady but modest, much like a stable but low-interest savings account.\n• Bonds: Bonds have a moderate level of fluctuation. They can rise and fall in value, but the changes are generally smaller compared to stocks.\n• Stocks: Stocks are the most volatile, The potential for high returns and loss is significant, so stock are more unpredictable of the three.\nThis analogy shows how each investment carries different levels of risk and return.\n\n").font(.nunito(.callout)) +
                Text("Reference").font(.nunito(.callout, .bold)) +
                Text(": Ross, S. A., Westerfield, R. W., & Jaffe, J. (2013). Corporate Finance. McGraw-Hill Education.").font(.nunito(.callout))
        }
    }
    
    var choicesText: [String]? {
        switch self {
            case .page01:
                [
                    "Buy deposito (Rp 10.000.000)",
                    "Buy Government Bonds (Rp 10.000.000)",
                    "Buy Stocks (Rp 10.000.000)"
                ]
            case .page02, .page03, .page04, .page05, .page06:
                nil
        }
    }
}
