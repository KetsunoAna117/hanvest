//
//  Module01PlantSpriteEntity.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import Foundation
import SpriteKit

class Plant: SKNode {
    init(image: SKSpriteNode) {
        super.init()
        
        self.setScale(1)
        self.zPosition = 4
        
        self.addChild(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
