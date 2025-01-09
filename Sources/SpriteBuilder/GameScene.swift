//
//  GameScene.swift
//  spritekit builder demo
//
//  Created by Craig Nunemaker on 11/27/23.
//

import Foundation
import SpriteKit

public struct GameScene{
	public var scene: SKScene = SKScene()
	private var delegate: any SceneProtocol
	public init(_ scene: any SceneProtocol){
		self.delegate = scene	
		buildScene()
		self.delegate.didLoad(to: self.scene)
		//self.scene.delegate = self.delegate.getSceneDelegate()
	}
	private func buildScene(){
		delegate.body.forEach(){
			$0.modify(scene: scene)
		}
	}
}
