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

public struct BlendMode: Modifier{
	let mode: SKBlendMode
	public init(_ mode: SKBlendMode){
		self.mode = mode
	}
	public func modify(node: SKNode){
		if let sprite = node as? SKSpriteNode{
			sprite.blendMode = mode
		}
	}
}

public struct Scale:Modifier{
	let scale: CGSize
	public init(_ by: Double){
		scale = CGSize(width: by, height: by)
	}
	public func modify(node: SKNode){
		node.xScale = CGFloat(scale.width)
		node.yScale = CGFloat(scale.height)
	}
}

