import SpriteKit
import GameColor

@resultBuilder
public enum ModifierBuilder{
	public static func buildBlock(_ components: Modifier...) -> [Modifier] {
		components
	}
	public static func buildOptional(_ component: Modifier?) -> [Modifier] {
		if component == nil{
			return []
		} else { return [component!]}
	}
}

public func Node(_ node:  SKNode, @ModifierBuilder _ components: ()->[Modifier])->  SKNode{
	let result = node
	components().forEach(){
		$0.modify(node: result)
	}
	print(node)
	return result
}

public protocol Modifier{
	func modify(node: SKNode)
	func modify(scene: SKScene)
}
extension Modifier{
	public func modify(node: SKNode){}
	public func modify(scene: SKScene){}
}

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

