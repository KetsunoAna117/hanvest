//
//  Module02ViewSegmentation.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

enum Module02PageLoopSegmentation {
    case textImage
    case textImageWithButtonDefault
    case headerWithDetailTextMain
    case headerWithDetailTextAlt
    
    var pageSegmentation: [Module02PageState] {
        switch self {
            case .textImage:
                [.page01, .page02, .page06]
            case .textImageWithButtonDefault:
                [.page03, .page05]
            case .headerWithDetailTextMain:
                [.page08, .page09]
            case .headerWithDetailTextAlt:
                [.page08Alt2, .page09Alt2]
        }
    }
    
    var textImageContent: [(headerText: String, imageText: Image)]? {
        switch self {
            case .textImage:
                [
                    (
                        "There’s a brand new iphone just released",
                        Image("iphone-pic-01")
                    ),
                    (
                        "Now you go the store to get one for yourself",
                        Image("iphone-pic-01")
                    ),
                    (
                        "You are set up this your brand new iphone",
                        Image("iphone-pic-02")
                    )
                ]
            case .textImageWithButtonDefault, .headerWithDetailTextMain, .headerWithDetailTextAlt:
                nil
        }
    }
    
    var textImageWithButtonDefaultContent: [(headerText: String, imageText: Image, choices: [String])]? {
        switch self {
            case .textImageWithButtonDefault:
                [
                    (
                        "Now choose the type of iphone you want to get",
                        Image("iphone-pic-01"),
                        ["Iphone 16", "Iphone 16 Pro Max"]
                    ),
                    (
                        "Choose the storage of the iphone",
                        Image("iphone-pic-01"),
                        ["256 GB", "512 GB"]
                    )
                ]
            case .textImage, .headerWithDetailTextMain, .headerWithDetailTextAlt:
                nil
        }
    }
    
    var headerWithDetailTextContent: [(headerText: Text, detailText: Text)]? {
        switch self {
            case .headerWithDetailTextMain:
                [
                    (
                        congratulationText() +
                        allAssetText(),
                        
                        detailTextWithAllAssets()
                    ),
                    (
                        whatIfText() +
                        liabilitiesText(),
                        
                        detailTextWithLiabilities()
                    )
                ]
            case .headerWithDetailTextAlt:
                [
                    (
                        congratulationText() +
                        liabilitiesText(),
                        
                        detailTextWithLiabilities()
                    ),
                    (
                        whatIfText() +
                        allAssetText(),
                        
                        detailTextWithAllAssets()
                    )
                ]
            case .textImage, .textImageWithButtonDefault:
                nil
        }
    }
        
    
    private func congratulationText() -> Text {
        return Text("Congratulation!\n").font(.nunito(.title2, .bold))
    }

    private func whatIfText() -> Text {
        return Text("What if?\n").font(.nunito(.title2, .bold))
    }
    
    private func liabilitiesText() -> Text {
        return Text("You got your iphone 16 pro with your liabilities").font(.nunito(.title2))
    }
    
    private func allAssetText() -> Text {
        return Text("You got your iphone 16 pro with your assets").font(.nunito(.title2))
    }

    private func detailTextWithAllAssets() -> Text {
        return Text("If you choose to pay with your ").font(.nunito(.callout)) +
            Text("debit card").font(.nunito(.callout, .bold)) +
            Text(", you're using your own money upfront. The cash is taken from your bank account immediately, and you get the iPhone 16 Pro with no strings attached. There are no future payments or debts to worry about. It's a clear and simple exchange: you trade your cash").font(.nunito(.callout)) +
            Text(" (asset) ").font(.nunito(.callout, .bold)) +
            Text("for the iPhone").font(.nunito(.callout)) +
            Text(" (another asset) ").font(.nunito(.callout, .bold)) +
            Text(", and you're done with the transaction.").font(.nunito(.callout))
    }

    private func detailTextWithLiabilities() -> Text {
        return Text("If you buy the iPhone 16 Pro using ").font(.nunito(.callout)) +
            Text("Pay Later").font(.nunito(.callout, .bold)) +
            Text(", you’re taking on a ").font(.nunito(.callout)) +
            Text("liability").font(.nunito(.callout, .bold)) +
            Text(". You get the iPhone now, but you owe Amazon the purchase price, which you'll have to repay in installments or by a specific date. Until the debt is fully paid off, this").font(.nunito(.callout)) +
            Text(" liability ").font(.nunito(.callout, .bold)) +
            Text("is hanging over your head. You enjoy the iPhone now, but you're financially tied to making future payments.").font(.nunito(.callout))
    }
}
