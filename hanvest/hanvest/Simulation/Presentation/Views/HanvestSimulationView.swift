//
//  HanvestSimulationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import SwiftUI

struct HanvestSimulationView: View {
    @StateObject private var viewmodel = HanvestSimulationViewModel()
    
    var body: some View {
        VStack {
            VStack {
                Text("This is list of available stocks")
                Divider()
            }
            
        }
    }
}

#Preview {
    HanvestSimulationView()
}
