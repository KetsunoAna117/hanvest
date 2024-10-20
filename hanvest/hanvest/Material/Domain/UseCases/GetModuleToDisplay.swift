//
//  GetModuleToDisplay.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 20/10/24.
//

protocol GetModuleToDisplay {
    func execute(userRisk: RiskProfileType) -> [ModuleNavigatiorEntity]
}

struct GetModuleToDisplayImpl: GetModuleToDisplay {
    func execute(userRisk: RiskProfileType) -> [ModuleNavigatiorEntity] {
        return [
            ModuleNavigatiorEntity(moduleID: "module01", moduleScreenID: .materialModule01, state: .next),
            ModuleNavigatiorEntity(moduleID: "module02", moduleScreenID: .materialModule02, state: .next),
            ModuleNavigatiorEntity(moduleID: "module03", moduleScreenID: .materialModule03, state: .next),
            ModuleNavigatiorEntity(moduleID: "module04", moduleScreenID: .materialModule04, state: .next),
            ModuleNavigatiorEntity(moduleID: "module05", moduleScreenID: .main, state: .next),
            ModuleNavigatiorEntity(moduleID: "module06", moduleScreenID: .main, state: .next)
        ]
    }
    
    
}
