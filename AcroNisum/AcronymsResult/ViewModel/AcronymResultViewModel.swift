//
//  AcronymResultViewModel.swift
//  AcroNisum
//
//  Created by Joaquin Wilson on 15-03-21.
//

import Foundation

class AcronymResultViewModel {

    var onDataRefresh = { () -> () in }

    var dataSource: AcronymResponse?

    func fetch() {
        self.onDataRefresh()
    }
}
