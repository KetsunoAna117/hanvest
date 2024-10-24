//
//  HanvestProfileHeaderViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

class HanvestProfileHeaderViewModel: ObservableObject {
    @Inject var getUserData: GetUserData
    
    @Published var userBalance: Int
    @Published var ownedLot: [String : Int]
    
    init(){
        self.userBalance = 0
        self.ownedLot = [:]
    }
    
    func setup(){
        guard let user = getUserData.execute() else {
            print("[ERROR] User data not found")
            return
        }
        
        self.userBalance = user.userBalance
        
        // Map each transaction into ownedLot variable
        user.userInvestmentTransaction.forEach { transaction in
            ownedLot[transaction.stockIDName] = (ownedLot[transaction.stockIDName] ?? 0) + transaction.stockLotQuantity
        }
        
    }
    
    func displayBalancePrefixAndSuffix() -> String {
        return HanvestPriceFormatter.formatIntToIDR(userBalance)
    }
    
}
