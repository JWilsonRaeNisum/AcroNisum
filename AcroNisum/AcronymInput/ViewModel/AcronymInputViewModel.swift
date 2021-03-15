//
//  AcronymInputViewModel.swift
//  AcroNisum
//
//  Created by Joaquin Wilson on 15-03-21.
//

import Foundation


class AcronymInputViewModel {

    var api: APIAcronymService?

    init(api: APIAcronymService = APIAcronym()) {
        self.api = api
    }

    var onDataRefresh = { () -> () in }
    var onErrorRefresh = { () -> () in }


    var response: [AcronymResponse]? {
        didSet {
            self.onDataRefresh()
        }
    }

    func fetch (shortForm: String, longForm: String? = nil) {
        api?.getAcronymFor(
            shortForm: shortForm,
            longForm: longForm,
            onSuccess: { [weak self] response, statusCode  in
                self?.response = response
            }, onError: { [weak self] error, statusCode  in
                self?.onErrorRefresh()
            }
        )
    }
}
