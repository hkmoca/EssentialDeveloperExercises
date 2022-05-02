//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Héctor Moreno Cano on 12/04/22.
//

import Foundation
import Combine

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}

