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
}