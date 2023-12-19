import Foundation

public struct RC{
    public let row: Int
    public let column: Int
    public init(_ row: Int, _ column: Int){
        self.row = row
        self.column = column
    }
}
extension RC: Hashable{ }
extension RC: CustomStringConvertible{
    public var description: String {
        "ROW:\(row),COLUMN:\(column)"
    }
}
