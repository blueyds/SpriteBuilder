
import SpriteKit


class SceneWrapper<Scene> where Scene: SceneProtocol{
    public let scene: SKScene
    public let delegate: Scene
    public init(_ delegate: Scene){
        self.scene = SKScene()
        self.delegate = delegate    
        buildScene()
        self.delegate.didLoad(to: self.scene)
        //self.scene.delegate = self.delegate.getSceneDelegate()
    }
    private func buildScene(){
        delegate.body.forEach(){
            $0.modify(scene: scene)
        }
    }
}
