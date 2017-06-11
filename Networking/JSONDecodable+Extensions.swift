import Foundation

extension Int64: JSONValueDecodable {
    public init?(jsonValue: Int){
        self.init(jsonValue)
    }
}

extension String: JSONValueDecodable {
    public init?(jsonValue: String){
        self.init(jsonValue)
    }
}
