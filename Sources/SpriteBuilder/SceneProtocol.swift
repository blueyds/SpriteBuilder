//
//  SceneProtocol.swift
//  spritekit builder demo
//
//  Created by Craig Nunemaker on 11/27/23.
//

import Foundation
import SpriteKit


public protocol SceneProtocol: AnyObject, SKSceneDelegate{
	@ModifierBuilder var body: [Modifier] { get }

}