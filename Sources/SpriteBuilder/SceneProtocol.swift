//
//  SceneProtocol.swift
//  spritekit builder demo
//
//  Created by Craig Nunemaker on 11/27/23.
//

import Foundation
import SpriteKit


public protocol SceneProtocol {
	@ModifierBuilder var body: [Modifier] { get }

	func setSKSceneReference(_ : SKScene)
	func update(_ : TimeInterval)

}

extension SceneProtocol{
	public func setSKSceneReference(_ scene: SKScene) { }
	// define a default update that does nothing
	public func update(_ currentTime: TimeInterval) { }
}
