import SpriteKit
import GameColor

public struct FillColor: Modifier{
	public let color: GameColor
	public init(_ color: GameColor){
		self.color = color
	}
	public func modify(node: SKNode) {
		if let shape = node as? SKShapeNode {
			shape.fillColor = color.skColor
		}
	}
}
