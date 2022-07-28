//
//  ResultController.swift
//  FindMyWord
//
//  Created by Shibanee Mishra on 27/07/22.
//

import UIKit

class ResultController: UIViewController {

    @IBOutlet weak var lblCorrectValue : UILabel!
    @IBOutlet weak var lblIncorrectValue : UILabel!
    var viewModel = WordGameViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        lblCorrectValue.text = String(viewModel.correctAttempts)
        lblIncorrectValue.text = String(viewModel.InCorrectAttempts)

    }
    
    @IBAction func startGameAgainAction(_ sender: UIButton) {
        navigationController?.pushViewController(WordGameController.getInstance(), animated: true)
    }

}

extension ResultController {
    static func getInstance(viewModel:WordGameViewModel) -> ResultController {
        let controller = ResultController()
            controller.viewModel = viewModel
        return controller
    }
}
