//
//  WordGameController.swift
//  FindMyWord
//
//  Created by Shibanee Mishra on 27/07/22.
//

import UIKit

class WordGameController: UIViewController {

    @IBOutlet weak var lblSpanish : UILabel!
    @IBOutlet weak var lblEnglish : UILabel!
    @IBOutlet weak var viewAnswer : UIView!
    var viewModel = WordGameViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getDataFromJsonFile()
        viewModel.createPairForTranslation()
        showdata()
    }

    
    func showdata(){
        
        lblEnglish.text = viewModel.displayWordsList[viewModel.questionSerialNumber].questionWord
        lblSpanish.text = viewModel.displayWordsList[viewModel.questionSerialNumber].answerWord
    }
    
   
    @IBAction func correctAction(_ sender: UIButton) {
        viewModel.checkAnswer(answer: .correct)
        if (viewModel.questionSerialNumber) != (viewModel.displayWordsList.count) {
            showdata()
        } else {
            navigationController?.pushViewController(ResultController.getInstance(viewModel: self.viewModel), animated: true)
        }
        
        
    }
    
    @IBAction func wrongAction(_ sender: UIButton) {
        viewModel.checkAnswer(answer: .wrong)
        if (viewModel.questionSerialNumber) != (viewModel.displayWordsList.count) {
            showdata()
        } else {
            navigationController?.pushViewController(ResultController.getInstance(viewModel: self.viewModel), animated: true)

        }

    }
}

extension WordGameController {
    static func getInstance() -> WordGameController {
        let controller = WordGameController()
        return controller
    }
}
