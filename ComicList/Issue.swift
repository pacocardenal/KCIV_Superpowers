import Foundation
import Networking

public struct Issue {
    public let issueId: Int64
    public let volume: Volume
}

extension Issue: JSONDecodable {
    public init(jsonDictionary: JSONDictionary) throws {
        let volumeId: Int64 = try unpack(from: jsonDictionary, keyPath: "volume.id")
        let volumeTitle: String = try unpack(from: jsonDictionary, keyPath: "volume.name")
        let volumeCoverURL: URL = try unpack(from: jsonDictionary, keyPath: "image.small_url")
        
        self.issueId = try unpack(from: jsonDictionary, key: "id")
        self.volume = Volume(identifier: volumeId, title: volumeTitle, coverURL: volumeCoverURL, description: nil)
    }
}

extension Issue {
    public static func issues(fromVolume volumeId: Int64) -> Resource<Response<Issue>> {
        return Resource(
            comicVinePath: "issues",
            parameters: [
                "api_key": apiKey,
                "field_list": "id,image,name,volume",
                "limit": "10",
                "page": "1",
                "filter": "volume:" + String(volumeId),
                "format": "json"
            ]
        )
    }
}
