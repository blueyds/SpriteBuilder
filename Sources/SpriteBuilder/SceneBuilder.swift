import SpriteKit
import GameColor


@resultBuilder
public enum SKSceneBuilder{
	public static func buildBlock(_ components: SKNode...) -> [SKNode] {
		components
	}

}


public struct BackgroundColor: Modifier{
	public let color: GameColor
	public func modify(scene: SKScene) {
		scene.backgroundColor = color.skColor
	}
}
public struct Size: Modifier{
	public let width: Double
	public let height: Double
	public func modify(scene: SKScene) {
		scene.size = CGSize(width: width, height: height)
	}
}
public struct Children: Modifier{
	public let children: [ SKNode]
	public init(@SKSceneBuilder _ builder: ()-> [SKNode]){
		children = builder()
	}
	public func modify(node: SKNode) {
		children.forEach(){
			node.addChild($0)
		}
	}
	public func modify(scene: SKScene) {
		children.forEach(){
			scene.addChild($0)
			if let cam = $0 as? SKCameraNode{
				scene.camera = cam
			}
		}
	}
}




