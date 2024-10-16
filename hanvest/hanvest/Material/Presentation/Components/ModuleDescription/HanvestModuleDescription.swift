//
//  HanvestModuleDescription.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 14/10/24.
//

import SwiftUI

struct HanvestModuleDescription: View {
    var title: String
    var description: String
    var action: () -> ()
    
    var body: some View {
        HanvestCardBackground{
            VStack(spacing: 16){
                VStack{
                    Text(title)
                        .font(.nunito(.title2, .bold))
                    
                    Text(description)
                        .font(.nunito(.subhead))
                }
                
                HanvestButtonDefault(
                    size: .medium,
                    style: .filled(isDisabled: false),
                    iconPosition: .hidden,
                    title: "Let's go",
                    image: Image(systemName: "person.fill"),
                    action: action
                )
            }
        }
    }
}

#Preview {
    HanvestModuleDescription(
            title: "Title",
            description: "Description Detail",
            action: {
                print("Let's go")
            }
        )
    .padding()
}
