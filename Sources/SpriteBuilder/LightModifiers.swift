import SpriteKit
import GameColor

public struct AmbientColor: Modifier{
	public let color: GameColor
	public init(_ color: GameColor) {
		self.color = color
	}
	public func modify(node: SKNode){
		if let light = node as? SKLightNode{
			light.ambientColor = color.skColor
		}
	}
}

public struct LightColor: Modifier{
	public let color: GameColor
	public init(_ color: GameColor) {
		self.color = color
	}
	public func modify(node: SKNode){
		if let light = node as? SKLightNode{
			light.lightColor = color.skColor
		}
	}
}

public struct ShadowColor: Modifier{
	public let color: GameColor
	public init(_ color: GameColor) {
		self.color = color
	}
	public func modify(node: SKNode){
		if let light = node as? SKLightNode{
			light.shadowColor = color.skColor
		}
	}
}

public struct Falloff: Modifier{
	public let falloff: CGFloat
	public init(_ falloff: CGFloat) {
		self.falloff = falloff
	}
	public func modify(node: SKNode){
		if let light = node as? SKLightNode{
			light.falloff = falloff
		}
	}
}

public struct Enabled: Modifier{
	public let enabled: Bool
	public init(_ enabled: Bool){
		self.enabled = enabled
	}
	public func modify(node: SKNode){
		if let light = node as? SKLightNode{
			light.isEnabled = enabled
		}
		if let field = node as? SKFieldNode{
			field.isEnabled = enabled
		}
	}
}

public struct CategoryBitMask: Modifier{
	public let bitMask: UInt32
	public init(_ bitMask: UInt32) {
		self.bitMask = bitMask
	}
	public func modify(node: SKNode){
		if let light = node as? SKLightNode{
			light.categoryBitMask = bitMask
		}
		if let field = node as? SKFieldNode{
			
		}
	}
}