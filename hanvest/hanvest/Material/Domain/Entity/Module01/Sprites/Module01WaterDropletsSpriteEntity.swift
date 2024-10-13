//
//  Module01WaterDropletsSpriteEntity.swift
//  hanvest
//
//  Created by Bryan Vernanda on 13/10/24.
//

import Foundation
import SpriteKit

class WaterDroplet: SKNode {
    init(image: SKSpriteNode, position: CGPoint) {
        super.init()
        
        self.setScale(1)
        self.zPosition = 1
        self.position = position
        
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "air"), size: CGSize(width: image.size.width, height: image.size.height))
        self.physicsBody?.categoryBitMask = SpriteCollisionTypes.waterDroplets.rawValue
        self.physicsBody?.contactTestBitMask = SpriteCollisionTypes.soil.rawValue
        self.physicsBody?.collisionBitMask = 0
        
        self.physicsBody?.linearDamping = 1 //adjust how fast an object falls
//        self.physicsBody?.restitution = 2 //adjust how bouncy an object is
        
        self.addChild(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
