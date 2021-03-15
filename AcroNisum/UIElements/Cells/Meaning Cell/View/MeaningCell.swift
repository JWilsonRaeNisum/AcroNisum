//
//  MeaningCell.swift
//  AcroNisum
//
//  Created by Joaquin Wilson on 15-03-21.
//

import UIKit

class MeaningCell: UITableViewCell {

    @IBOutlet weak var meaning: UILabel!
    @IBOutlet weak var frequency: UILabel!
    @IBOutlet weak var since: UILabel!

    var viewModel: MeaningCellViewModel? {
        didSet {
            meaning.text = viewModel?.meaning
            frequency.text = viewModel?.frequency
            since.text = viewModel?.since
        }
    }

    func configure(with viewModel: MeaningCellViewModel) {
        self.viewModel = viewModel
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = false
        self.viewModel?.fetch()

    }

    override func prepareForReuse() {
        self.viewModel = nil
        self.meaning.text = ""
        self.frequency.text = ""
        self.since.text = ""
    }
}
