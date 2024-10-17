//
//  Module02TextImage.swift
//  hanvest
//
//  Created by Bryan Vernanda on 16/10/24.
//

import SwiftUI

enum Module02TextImageChoices: Int, CaseIterable {
    case page01 = 0
    case page02 = 1
    case page03 = 2
    case page04 = 3
    case page05 = 4
    case page06 = 5
    case page07 = 6
    
    var headerText: String {
        switch self {
            case .page01: 
                "There’s a brand new iphone just released"
            case .page02: 
                "Now you go the store to get one for yourself"
            case .page03:
                "Now choose the type of iphone you want to get"
            case .page04:
                "Now choose the color you want"
            case .page05:
                "Choose the storage of the iphone"
            case .page06:
                "You are set up this your brand new iphone"
            case .page07:
                "Now it's time for you to pay, choose wisely your payment method"
        }
    }
    
    var image: Image? {
        switch self {
            case .page01, .page02, .page03, .page04, .page05:
                Image("iphone-pic-01")
            case .page06:
                Image("iphone-pic-02")
            case .page07:
                nil
        }
    }
    
    var choicesText: [String]? {
        switch self {
            case .page03:
                ["Iphone 16", "Iphone 16 Pro Max"]
            case .page05:
                ["256 GB", "512 GB"]
            case .page07:
                ["Pay with Debit Card (Rp 24.999.000)", "Pay with PayLater (Rp 24.999.000)"]
            case .page01, .page02, .page04, .page06:
                nil
        }
    }
    
    var textAndImageSpacing: CGFloat? {
        switch self {
            case .page01, .page02, .page03:
                65
            case .page04, .page05:
                98
            case .page06:
                78
            case .page07:
                nil
        }
    }
    
    var eachComponentSpacing: CGFloat? {
        switch self {
            case .page03, .page05, .page07:
                24
            case .page04:
                40
            case .page01, .page02, .page06:
                nil
        }
    }
    
    var choicesColor: [HanvestModule02ColorOptions]? {
        switch self {
            case .page04:
                HanvestModule02ColorOptions.allCases
            case .page01, .page02, .page03, .page05, .page06, .page07:
                nil
        }
    }
    
    var spacingVstackCustom: CGFloat {
        switch self {
            case .page01, .page02:
                238
            case .page03, .page05:
                77
            case .page04:
                138
            case .page06:
                177
            case .page07:
                380
        }
    }
}
