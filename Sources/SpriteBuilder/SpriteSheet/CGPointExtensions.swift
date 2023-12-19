import SwiftUI

extension CGPoint{
    public func toFloats(_ bounds: CGSize)->(xFromCenter: Float, yFromCenter: Float){
        var result = (xFromCenter: Float(0), yFromCenter: Float(0))
        let xF: Float = Float(self.x)
        let yF: Float = Float(self.y)
        let height: Float = Float(bounds.height)
        let width: Float = Float(bounds.width)
        result.xFromCenter = (xF - width * 0.5) / (width * 0.5)
        result.yFromCenter = -(yF - height * 0.5) / (height * 0.5)
        return result
    }
}
