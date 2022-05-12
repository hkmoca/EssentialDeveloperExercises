//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Héctor Moreno Cano on 17/04/22.
//

import Foundation

internal final class FeedImagesMapper {
    private struct Root: Decodable {
        let items: [RemoteFeedImage]
    }
    
    static var OK_200: Int { return 200 }
    
    static func map(
        _ data: Data,
        from response: HTTPURLResponse
    ) throws -> [RemoteFeedImage] {
        guard response.statusCode == OK_200,
        let root = try? JSONDecoder().decode(Root.self, from: data)
        else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        return root.items
    }
}
