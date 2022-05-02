//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Héctor Moreno Cano on 02/05/22.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
