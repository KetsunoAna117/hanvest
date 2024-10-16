//
//  Module02PageState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import Foundation

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
    
//    var pageText: (headerText: Text, detailText: Text?, choices: [String]?) {
//        switch self {
//            case .page01:
//                (Text("There’s a brand new iphone just released").font(.nunito(.title2)), nil, nil)
//            case .page02:
//                (Text("Now you go the store to get one for yourself").font(.nunito(.title2)), nil, nil)
//            case .page03:
//                (
//                    Text("Now choose the type of iphone you want to get").font(.nunito(.title2)),
//                    nil,
//                    ["Iphone 16", "Iphone 16 Pro Max"]
//                )
//            case .page04:
//                (Text("Now choose the color you want").font(.nunito(.title2)), nil, nil)
//            case .page05:
//                (
//                    Text("Choose the storage of the iphone").font(.nunito(.title2)),
//                    nil,
//                    ["256 GB", "512 GB"]
//                )
//            case .page06:
//                (Text("You are set up this your brand new iphone").font(.nunito(.title2)), nil, nil)
//            case .page07:
//                (Text("Now its time for you to pay choose wisely your payment method").font(.nunito(.title2)))
//            case .page08:
//                Text("Congratulation!\n").font(.nunito(.title2, .bold)) +
//                Text("You got your iphone 16 pro with your assets").font(.nunito(.title2))
//            case .page09:
//                Text("What if?\n").font(.nunito(.title2, .bold)) +
//                Text("You got your iphone 16 pro, but with all your liabilities").font(.nunito(.title2))
//            case .page08Alt2:
//                Text("Congratulation!\n").font(.nunito(.title2, .bold)) +
//                Text("You got your iphone 16 pro with your liabilities").font(.nunito(.title2))
//            case .page09Alt2:
//                Text("What if?\n").font(.nunito(.title2, .bold)) +
//                Text("You got your iphone 16 pro, but with all your assets").font(.nunito(.title2))
//            case .page10:
//                Text("In summary\n").font(.nunito(.title2, .bold)) +
//                Text("Liabilites vs Assets").font(.nunito(.title2))
//        }
//    }
    
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
}
