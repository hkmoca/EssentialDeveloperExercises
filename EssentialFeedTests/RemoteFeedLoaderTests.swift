//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Héctor Moreno Cano on 13/04/22.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {
   private class HTTPClientSpy: HTTPClient {
        var requestedURLs = [URL]()
        var error: Error?
       func get(from url: URL, completion: @escaping (Error) -> Void) {
           if let error = error {
               completion(error)
           }
            requestedURLs.append(url)
        }
    }
    
    private func makeSUT(url: URL = URL(string: "www.google.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }

    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "www.google.com)")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        
        XCTAssertEqual(client.requestedURLs, [url])
    }
    
    func test_loadTwice_requestDataFromURL() {
        let url = URL(string: "www.google.com)")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        sut.load()
        
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    func test_load_deliversErrorOnClientError() {
        let (sut, client) = makeSUT()
        client.error = NSError(domain: "", code: 0)
        var capturedError: RemoteFeedLoader.Error?
        sut.load { error in
            capturedError = error
        }
        
        XCTAssertEqual(capturedError, .connectivity)
    }
    
}
