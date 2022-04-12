//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Héctor Moreno Cano on 12/04/22.
//

import Foundation
import Combine

enum FeedLoadResult {
    case succes([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (FeedLoadResult) -> Void)
    func loadPublisher() -> AnyPublisher<[FeedItem], Error>
}

