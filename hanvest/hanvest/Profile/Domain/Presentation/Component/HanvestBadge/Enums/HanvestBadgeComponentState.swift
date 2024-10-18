//
//  HanvestBadgeComponentState.swift
//  hanvest
//
//  Created by Christian Gunawan on 17/10/24.
//
import SwiftUI

enum HanvestBadgeComponentState {
    case achieved
    case unachieved
    
    var isAchieved: Bool {
        switch self {
        case .achieved:
            return true
        case .unachieved:
            return false
        }
    }
}
