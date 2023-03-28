//
//  AppViewController.swift


import UIKit

class AppViewController<TViewModel: AppViewModel>: UIViewController {

    var viewModel: TViewModel!

    override func viewDidLoad() {
        bindViewModel()
    }

    func bindViewModel() {
        viewModel.error.observeNext { [weak self] (error) in
            self?.showError(error: error)
        }.dispose(in: bag)
    }

    func showError(error: AppError?) {
        guard let error = error else {
            return
        }

        let alert = UIAlertController(title: "Alert", message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
