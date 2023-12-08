import SpriteKit

public struct Positional: Modifier{
	public let positional: Bool
	public init(_ positional: Bool){
		self.positional = positional
	}
	public func modify(node: SKNode){
		if let audio = node as? SKAudioNode{
			audio.isPositional = positional
		}
	}
}

public struct AutoPlayLoop: Modifier{
	public let looped: Bool
	public init(_ looped: Bool){
		self.looped = looped
	}
	public func modify(node: SKNode){
		if let audio = node as? SKAudioNode{
			audio.autoPlayLooped = looped
		}
	}
}


//Positional
//AutoPlayLoop