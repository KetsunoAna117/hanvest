//
//  HanvestProfileHeaderViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

@Observable class HanvestProfileHeaderViewModel {
    var userBalance: Int
    
    init(){
        self.userBalance = 100000000
    }
    
    func displayBalancePrefixAndSuffix() -> String {
        return HanvestPriceFormatter.formatIntToIDR(userBalance)
    }
    
}
