//
//  MeaningCellViewModel.swift
//  AcroNisum
//
//  Created by Joaquin Wilson on 15-03-21.
//

import Foundation

class MeaningCellViewModel {

    var onDataRefresh = { () -> () in }

    var meaning: String
    var frequency: String
    var since: String

    init(data: LongFormObject = .init(lf: "", freq: -1, since: -1, variationObjects: [])) {
        self.meaning = data.lf
        self.frequency = String(data.freq)
        self.since = String(data.since)
    }

    func fetch() {
        self.onDataRefresh()
    }
}
