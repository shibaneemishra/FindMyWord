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
    @IBOutlet weak var viewQuestion : UIView!

    var viewModel = WordGameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getDataFromJsonFile()
        viewModel.createPairForTranslation()
        showdata()
        viewModel.finshedGame = {
            self.navigationController?.pushViewController(ResultController.getInstance(viewModel: self.viewModel), animated: true)
        }
    }
    
    
    func showdata(){
        
        lblEnglish.text = viewModel.displayWordsList[viewModel.questionSerialNumber].question
        lblSpanish.text = viewModel.displayWordsList[viewModel.questionSerialNumber].answer
        self.annimation()
    }
    
    func annimation(){
        UIView.animate(withDuration: 5.0, delay: 0, options: [.curveEaseInOut], animations: {
            self.viewAnswer.center.y += 400
            self.viewAnswer.alpha = 0
        }) { [self] (finished) in
            if finished {
                viewAnswer.alpha = 1
                self.viewAnswer.center.y -= 400
                viewModel.checkAnswer(answer: .wrong)
                if ((viewModel.questionSerialNumber) != (viewModel.displayWordsList.count)) && (viewModel.InCorrectAttempts < 3) {
                    showdata()
                } else {
                    navigationController?.pushViewController(ResultController.getInstance(viewModel: self.viewModel), animated: true)
                }
            }
        }
    }
    
    
    @IBAction func correctAction(_ sender: UIButton) {
        viewAnswer.alpha = 1
        self.viewAnswer.center.y = self.viewQuestion.center.y + 50
        self.viewAnswer.layer.removeAllAnimations()
        viewModel.checkAnswer(answer: .correct)

        if (viewModel.questionSerialNumber) != (viewModel.displayWordsList.count) && (viewModel.InCorrectAttempts < 3) {
            showdata()
        } else {
            navigationController?.pushViewController(ResultController.getInstance(viewModel: self.viewModel), animated: true)
        }
        
        
    }
    
    @IBAction func wrongAction(_ sender: UIButton) {
        viewAnswer.alpha = 1
        self.viewAnswer.center.y = self.viewQuestion.center.y + 50
        self.viewAnswer.layer.removeAllAnimations()
        viewModel.checkAnswer(answer: .wrong)
        if (viewModel.questionSerialNumber) != (viewModel.displayWordsList.count) && (viewModel.InCorrectAttempts < 3) {
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
