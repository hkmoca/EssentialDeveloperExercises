//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Héctor Moreno Cano on 23/05/22.
//

import Foundation

 func anyNSError() -> NSError {
     return NSError(domain: "any error", code: 0)
 }

 func anyURL() -> URL {
     return URL(string: "http://any-url.com")!
 }
