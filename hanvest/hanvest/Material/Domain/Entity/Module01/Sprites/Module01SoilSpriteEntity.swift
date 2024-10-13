//
//  Module01SoilSpriteEntity.swift
//  hanvest
//
//  Created by Bryan Vernanda on 13/10/24.
//

import Foundation
import SpriteKit

class Soil: SKNode {
    init(image: SKSpriteNode) {
        super.init()
        
        self.setScale(1)
        self.zPosition = 2
        self.position = CGPoint(x: UIScreen.main.bounds.width / 1.99, y: UIScreen.main.bounds.width / 2.05)
        
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "soil"), size: CGSize(width: image.size.width, height: image.size.height))
        self.physicsBody?.categoryBitMask = SpriteCollisionTypes.soil.rawValue
        self.physicsBody?.contactTestBitMask = SpriteCollisionTypes.waterDroplets.rawValue
        self.physicsBody?.isDynamic = false
        
        self.addChild(image)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
