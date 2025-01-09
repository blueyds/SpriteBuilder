import SpriteKit


public struct FillColor: Modifier{
	public let color: UIColor
	public init(_ color: UIColor){
		self.color = color
	}
	public func modify(node: SKNode) {
		if let shape = node as? SKShapeNode {
			shape.fillColor = color
		}
	}
}
