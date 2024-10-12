//
//  ModuleJourneyViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/10/24.
//

import Foundation

@Observable
class ModuleJourneyViewModel {
    let numberOfModules: Int = 6
    var userTempModulesProgress: [HanvestModuleNumberDefaultStyle]
    
    init() {
        userTempModulesProgress = Array(repeating: .next, count: numberOfModules)
        userTempModulesProgress[0] = .current
    }
    
    func updateUserModuleProgressIfDone(moduleIndex: Int) {
        if moduleIndex >= 1 && moduleIndex < numberOfModules {
            userTempModulesProgress[moduleIndex-1] = .done
            userTempModulesProgress[moduleIndex] = .current
        } else {
            userTempModulesProgress[moduleIndex-1] = .done
        }
    }
    
    func getUserModuleProgress(moduleIndex: Int) -> HanvestModuleNumberDefaultStyle {
        if moduleIndex >= 1 && moduleIndex <= numberOfModules {
            return userTempModulesProgress[moduleIndex - 1]
        } else {
            return .next
        }
    }
}
