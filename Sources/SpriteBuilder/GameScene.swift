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
	private var delegate: SceneProtocol
	public init(_ scene: SceneProtocol){
		self.delegate = scene
		buildScene()
	}
	private func buildScene(){
		delegate.body.forEach(){
			$0.modify(scene: scene)
		}
	}
}
