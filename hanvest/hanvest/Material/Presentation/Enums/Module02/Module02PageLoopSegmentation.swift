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
                [.page01, .page02, .page04, .page06] // if page04 then textimageradiobutton
            case .textImageWithButtonDefault:
                [.page03, .page05, .page07] // if page.07 then multichoice
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
                        "Now choose the color you want",
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
                    ),
                    (
                        "Now its time for you to pay choose wisely your payment method",
                        Image("iphone-pic-01"),
                        ["Pay with Debit Card (Rp 24.999.000)", "Pay with PayLater (Rp 24.999.000)"]
                    )
                ]
            case .textImage, .headerWithDetailTextMain, .headerWithDetailTextAlt:
                nil
        }
    }
    
//    var headerWithDetailTextContent: [(headerText: Text, detailText: Text)]? {
//        switch self {
//            case .headerWithDetailTextMain:
//                [
//                    (
//                        Text("Congratulation!\n").font(.nunito(.title2, .bold)) +
//                        Text("You got your iphone 16 pro with your assets").font(.nunito(.title2)),
//                        
//                        
//                    ),
//                    (
//                        Text("What if?\n").font(.nunito(.title2, .bold)) +
//                        Text("You got your iphone 16 pro, but with all your liabilities").font(.nunito(.title2)),
//                        
//                        
//                    )
//                ]
//            case .headerWithDetailTextAlt:
//                [
//                    (
//                        Text("Congratulation!\n").font(.nunito(.title2, .bold)) +
//                        Text("You got your iphone 16 pro with your liabilities").font(.nunito(.title2)),
//                        
//                        
//                    ),
//                    (
//                        Text("What if?\n").font(.nunito(.title2, .bold)) +
//                        Text("You got your iphone 16 pro, but with all your assets").font(.nunito(.title2)),
//                        
//                        
//                    )
//                ]
//            case .textImage, .textImageWithButtonDefault:
//                nil
//        }
//    }
        
}
