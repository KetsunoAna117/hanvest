//
//  Modue05ProfileViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 24/10/24.
//

class Module05ProfileViewModel: HanvestProfileHeaderViewModel {
    override func setup(){
        let fetchedUser = getUserData.execute()
        
        self.user = UserDataEntity(
            userId: fetchedUser?.userId ?? "",
            userName: fetchedUser?.userName ?? "",
            userBalance: 1000000,
            userRiskProfile: fetchedUser?.userRiskProfile ?? .conservative,
            userInvestmentTransaction: [],
            transactionQueue: [],
            moduleCompletionList: []
        )
    }
}
