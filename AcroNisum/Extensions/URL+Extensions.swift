//
//  URL+Extensions.swift
//  AcroNisum
//
//  Created by Joaquin Wilson on 15-03-21.
//

import Foundation

extension URL {
    mutating public func appendQueryItem(name: String, value: String?) {
        guard var urlComponents = URLComponents(string: absoluteString) else { return }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        let queryItem = URLQueryItem(name: name, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        self = urlComponents.url!
    }
}
