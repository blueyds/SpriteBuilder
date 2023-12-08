import SpriteKit

public struct Texture: Modifier{
	public let texture: SKTexture
	public init(_ texture: SKTexture){
		self.texture = texture
	}
	public func modify(node: SKNode){
		if let sprite = node as? SKSpriteNode{
			sprite.texture = texture
		}
	}
}


