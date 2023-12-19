
import SpriteKit

// sourced from stackexhange.com
// modified by craig 
public protocol SpriteSheet{
    var baseTexture: SKTexture { get }
    //var map: SKTileMapNode { get }
    func getSpriteTileSize()-> CGSize
    func getDefinition(for: RC)-> SKTileDefinition
}
    //var definitions:[ RC: SKTileDefinition] = [:]
    // tileSets: [RC: SKTileSet] = []
extension SpriteSheet{   
    public func getSpriteTileSize()->CGSize{
        .thirtyTwo
    }
    public func getDefinition(for rc: RC)-> SKTileDefinition{
        SKTileDefinition(texture: cropTexture(row: rc.row, column: rc.column))
    }
    
    
    public func cropTexture(row: Int, column: Int, w: CGFloat = 1, h: CGFloat = 1) -> SKTexture {
        assert(row <= rows, "\(row) > \(rows)")
        assert(column <= columns, "\(column) > \(columns)")
        assert(row > 0, "\(row) <= 0")
        assert(column > 0, "\(column) <= 0")
        let rect = CGRect(x: textureSize.width * CGFloat(column - 1),
                          y: textureSize.height *  CGFloat(rows - row),
                          width: textureSize.width * w,
                          height: textureSize.height * h)
        return SKTexture(rect: rect, in: baseTexture)
    }
    
    public var textureSize: CGSize {
        CGSize(width: baseTexture.textureRect().width / CGFloat(columns),
               height: baseTexture.textureRect().height / CGFloat(rows))
    }
    
    public var allTextures: [RC: SKTexture] {
        var result : [RC: SKTexture] = [:]
        for row in 1...rows{
            for column in 1...columns{
                let texture = cropTexture(row: row, column: column)
                result.updateValue(texture,
                                   forKey: RC(row, column))
            }
        }
        return result
    }
    public var rows: Int{
        Int(baseTexture.size().height / getSpriteTileSize().height)
    }
    public var columns: Int{
        Int(baseTexture.size().width / getSpriteTileSize().width)
    }
    
    func isRCInBounds(_ rc: RC)-> Bool{
        var result: Bool = true
        if rc.row > rows { result = false }
        if rc.column > columns { result = false}
        if rc.row < 1 { result = false }
        if rc.column < 1 { result = false }
        return result
    }
}


extension SpriteSheet{
    public func createGroup(at rc: RC)-> SKTileGroup{
        SKTileGroup(tileDefinition: getDefinition(for: rc))
    }
    public func createGroup(at rc: [RC], with adjacency: SKTileAdjacencyMask = .adjacencyAll) -> SKTileGroup {
        SKTileGroup(rules: [createRule(adjaceny: adjacency, rc)])
    }
    public func createRule(adjaceny: SKTileAdjacencyMask, _ ruleDefsRC: [RC])-> SKTileGroupRule{
        let defs: [SKTileDefinition] = ruleDefsRC.compactMap({getDefinition(for: $0)})
        print(defs)
        return SKTileGroupRule(adjacency: adjaceny, tileDefinitions: defs)
    }
}
