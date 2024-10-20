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
            ModuleNavigatiorEntity(moduleID: "module01", moduleScreenID: .materialModule01),
            ModuleNavigatiorEntity(moduleID: "module02", moduleScreenID: .materialModule02),
            ModuleNavigatiorEntity(moduleID: "module03", moduleScreenID: .materialModule03),
            ModuleNavigatiorEntity(moduleID: "module04", moduleScreenID: .materialModule04),
            ModuleNavigatiorEntity(moduleID: "module05", moduleScreenID: .main),
            ModuleNavigatiorEntity(moduleID: "module06", moduleScreenID: .main)
        ]
    }
    
    
}
