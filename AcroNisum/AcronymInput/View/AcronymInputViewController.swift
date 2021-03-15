//
//  AcronymInputViewController.swift
//  AcroNisum
//
//  Created by Joaquin Wilson on 15-03-21.
//

import UIKit

class AcronymInputViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var abbreviationTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton? {
        didSet {
            searchButton?.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        }
    }

    var viewModel = AcronymInputViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true	
        bind()
    }

    @objc
    private func searchButtonPressed() {
        if let shortForm = abbreviationTextField.text {
            activityIndicator.isHidden.toggle()
            activityIndicator.startAnimating()
            viewModel.fetch(shortForm: shortForm)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let acrominesResultVC = segue.destination as? AcronymsResultViewController {
            acrominesResultVC.viewModel.dataSource = viewModel.response?.first
        }
    }

    private func bind() {
        viewModel.onDataRefresh = { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden.toggle()
            let shortText = self?.abbreviationTextField.text ?? ""
            if let response = self?.viewModel.response, response.isEmpty {
                self?.presentAlertWith(title: "Error", message: "There is no acronyms for \(shortText)", actionTitle: "Please try another one")
                return
            }

            self?.performSegue(withIdentifier: "AcrominesResult", sender: nil)
        }

        viewModel.onErrorRefresh = { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden.toggle()
            self?.presentAlertWith(title: "Error", message: "Something went wrong", actionTitle: "Please try again later")
        }
    }
}

