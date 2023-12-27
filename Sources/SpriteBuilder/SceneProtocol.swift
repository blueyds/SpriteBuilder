//
//  SceneProtocol.swift
//  spritekit builder demo
//
//  Created by Craig Nunemaker on 11/27/23.
//

import Foundation
import SpriteKit


public protocol SceneProtocol{
	@ModifierBuilder var body: [Modifier] { get }
	func didLoad(to: SKScene)
}

extension SceneProtocol{
	public func didLoad(to: SKScene) { }
	public func build(scene: SKScene){
		body.forEach(){
            $0.modify(scene: scene)
        }
	}
	public func build()->SKScene{
		let scene = SKScene()
		build(scene: scene)
		return scene
	}
}