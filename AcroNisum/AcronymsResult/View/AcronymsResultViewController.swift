//
//  AcronymsResultViewController.swift
//  AcroNisum
//
//  Created by Joaquin Wilson on 15-03-21.
//

import UIKit

class AcronymsResultViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var viewModel = AcronymResultViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.fetch()
    }

    fileprivate func setupTableView() {
        tableView.dataSource = self
        let meaningCell = UINib(nibName: "MeaningCell", bundle: nil)
        tableView.register(meaningCell, forCellReuseIdentifier: "MeaningCell")

        viewModel.onDataRefresh = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension AcronymsResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSource?.lfs.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MeaningCell") as? MeaningCell,
              let data = viewModel.dataSource?.lfs[indexPath.row]
        else {
            fatalError("Cell must be registered and we need data to display content.")
        }

        let viewModel = MeaningCellViewModel(data: data)
        cell.configure(with: viewModel)
        return cell
    }
}
