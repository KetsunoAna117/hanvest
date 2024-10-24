//
//  HanvestProfileHeaderViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

class HanvestProfileHeaderViewModel: ObservableObject {
    @Inject var getUserData: GetUserData
    
    @Published var user: UserDataEntity?
    
    init(){
        
    }
    
    func setup(){
        guard let user = getUserData.execute() else {
            print("[ERROR] User data not found")
            return
        }
        
        self.user = user
        
    }
    
}
