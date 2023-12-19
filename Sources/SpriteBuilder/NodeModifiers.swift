import SpriteKit

public struct Position: Modifier{
	public let x: Int
	public let y: Int
	public init(_ x: Int, _ y: Int){
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
	let zPosition: CGFloar
	public init(_ pos: CGFloat){
		self.zPosition = pos
	}
	public func modify(node: SKNode){
		node.zPosition = zPosition
	}
}