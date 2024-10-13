//
//  hanvestApp.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 30/09/24.
//

import SwiftUI

@main
struct hanvestApp: App {
    
    init(){
        AppModule.inject()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
