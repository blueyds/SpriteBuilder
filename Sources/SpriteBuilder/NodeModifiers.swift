import SpriteKit

public struct Position: Modifier{
	public let x: CGFloat
	public let y: CGFloat
	public init(_ x: CGFloat, _ y: CGFloat){
		self.x = x
		self.y = y	
	}
	public func modify(node: SKNode) {
		node.position = CGPoint(x: x, y: y)
	}
	public func modify(scene: SKScene) {
		scene.position = CGPoint(x: x, y: y)
	}
}
public struct Name: Modifier{
	public let name: String
	public init(_ name: String){
		self.name = name
	}
	public func modify(node: SKNode) {
		node.name = name
	}
	public func modify(scene: SKScene) {
		scene.name = name
	}
}

public struct ZPosition: Modifier{
	let zPosition: CGFloat
	public init(_ pos: CGFloat){
		self.zPosition = pos
	}
	public func modify(node: SKNode){
		node.zPosition = zPosition
	}
}