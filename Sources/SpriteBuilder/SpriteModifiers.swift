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
	let xScale: CGFloat
	let yScale: CGFloat
	public init(by value: Double){
		let v = CGFloat(value)
		xScale = v
		yScale = v
	}
	public init(by value: CGFloat){
		xScale = value
		yScale = value
	}
	public func modify(node: SKNode){
		node.xScale = xScale
		node.yScale = yScale
	}
}

