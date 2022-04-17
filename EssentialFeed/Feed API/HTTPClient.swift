//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Héctor Moreno Cano on 17/04/22.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
