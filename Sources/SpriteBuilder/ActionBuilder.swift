import SpriteKit


public protocol ActionModifier: Modifier{
	var action: SKAction { get }
	var name: String { get }
}

public struct ActionSequence: ActionModifier{
	public let action:SKAction
	public let name: String
	public init(_ name: String = "", @ActionBuilder _ builder: ()-> [SKAction]){
		action = SKAction.sequence(builder())
		self.name = name
	}
}

public struct ActionGroup: ActionModifier{
	public let action:SKAction
	public let name: String
	public init(_ name: String = "", @ActionBuilder _ builder: ()-> [SKAction]){
		action = SKAction.group(builder())
		self.name = name
	}
}

public struct ActionRepeatSequence: ActionModifier{
	public let action:SKAction
	public let name: String
	public init(_ name: String = "", _ cycles: Int? = nil, @ActionBuilder _ builder: ()-> [SKAction]){
	if cycles == nil {
		action = SKAction.repeatForever(SKAction.sequence(builder()))
	}else {
		action = SKAction.repeat(SKAction.sequence(builder()), count: cycles!)
	}
		self.name = name
	}

	public init(_ name: String, _ cycles: Int? = nil, _ modifiers: [ActionModifier]  ) {
		self.name = name
		let actions = modifiers.compactMap({$0.action})
		if cycles == nil{
			action = SKAction.repeatForever(SKAction.sequence(actions))
		} else {
			action = SKAction.repeat(SKAction.sequence(actions), count: cycles!)
		}
	}
}
public struct ActionRepeatGroup: ActionModifier{
	public let action: SKAction
	public let name: String
	public init(_ name: String = "", _ cycles: Int? = nil, @ActionBuilder _ builder: ()-> [SKAction]){
	if cycles == nil {
		action = SKAction.repeatForever(SKAction.group(builder()))
	}else {
		action = SKAction.repeat(SKAction.group(builder()), count: cycles!)
	}
		self.name = name
	}

	public init(_ name: String, _ cycles: Int? = nil, _ modifiers: [ActionModifier]  ) {
		self.name = name
		let actions = modifiers.compactMap({$0.action})
		if cycles == nil{
			action = SKAction.repeatForever(SKAction.group(actions))
		} else {
			action = SKAction.repeat(SKAction.group(actions), count: cycles!)
		}
	}
}


extension  ActionModifier{
	public func modify(node: SKNode) {
		runOn(node: node)
	}
	public func modify(scene: SKScene) {
		runOn(scene: scene)
	}
	public func runOn(node: SKNode){
		if name.count == 0{
			node.run(action)
		}else{
			node.run(action, withKey: name)
		}
	}
	public func runOn(scene: SKScene){
		if name.count == 0 {
			scene.run(action)
		} else{
			scene.run(action, withKey: name)
		}
	}
}
@resultBuilder
public enum ActionBuilder{
	public static func buildBlock(_ components: SKAction...) -> [SKAction] {
		components
	}
	public static func buildBlock(_ components: ActionModifier...) -> [SKAction] {
		components.compactMap({$0.action})
	}
}

