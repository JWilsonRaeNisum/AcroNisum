//
//  APIAcronym.swift
//  AcroNisum
//
//  Created by Joaquin Wilson on 15-03-21.
//

import Foundation

public class APIAcronym: APIAcronymService {
    func getAcronymFor(
        shortForm: String,
        longForm: String?,
        onSuccess: @escaping ([AcronymResponse], Int) -> Void,
        onError: @escaping ErrorCallBack
    ) {
        var url = URL(string: APIConstants.url)!
        url.appendQueryItem(name: "sf", value: shortForm)
        if longForm != nil {
            url.appendQueryItem(name: "lf", value: longForm)
        }

        Network().request(
            url: url,
            method: .GET,
            parameters: nil as AcronymResponse?,
            responseType: [AcronymResponse].self,
            onSuccess: onSuccess,
            onFailure: onError)
    }
}




// How to use
var url = URL(string: "https://www.example.com")!
