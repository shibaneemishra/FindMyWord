//
//  ResultController.swift
//  FindMyWord
//
//  Created by Shibanee Mishra on 27/07/22.
//

import UIKit

class ResultController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}
extension ResultController {
    static func getInstance(viewModel:WordGameViewModel) -> ResultController {
        let controller = ResultController()
        return controller
    }
}
