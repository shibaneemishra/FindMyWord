//
//  WordGameViewModel.swift
//  FindMyWord
//
//  Created by Shibanee Mishra on 27/07/22.
//

import UIKit

class WordGameViewModel {

    enum answerType { case correct , wrong }
    var correctAttempts:Int = 0
    var InCorrectAttempts:Int = 0
    var questionSerialNumber:Int = 0
    var fetchWordsList:[WordModel] = []
    var displayWordsList:[DisplayWordModel] = []
    let displayQuestionsCount = 15
    var finshedGame: (() -> Void)?


    
    func getDataFromJsonFile(){
        
        if let path = Bundle.main.path(forResource: "words", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let translatedWords = try JSONDecoder().decode([WordModel].self, from: data)
                self.fetchWordsList = translatedWords

              } catch {
                   // handle error
                  fatalError("Couldn't read translated words data from file!")

              }
        }
    }
    
    func createPairForTranslation(){
        
        let shuffled = fetchWordsList.shuffled().prefix(self.displayQuestionsCount)
        let quarter = self.displayQuestionsCount/4 // 25% provalbility
        let CorrectPair = shuffled.prefix(quarter).map {
            return DisplayWordModel(question: $0.english,
                                    answer: $0.spanish,
                                    isCorrect: true)
        }
        
        let IncorrectPair: [DisplayWordModel] = shuffled.suffix(self.displayQuestionsCount-quarter).map {
            let allPossibleTranslations = Set(fetchWordsList.map { $0.spanish })
            let answerWord = allPossibleTranslations.randomElement() ?? $0.spanish
            return DisplayWordModel(question: $0.english,
                                    answer: answerWord,
                                    isCorrect: answerWord == $0.spanish)
            
        }
        displayWordsList = (CorrectPair + IncorrectPair).shuffled()
    }
    
    func checkAnswer(answer:answerType){
        
        switch answer {
        case .correct:
            if displayWordsList[questionSerialNumber].isCorrect == true {
                correctAttempts += 1
            }
            else
             { InCorrectAttempts += 1 }
        case .wrong:
            if displayWordsList[questionSerialNumber].isCorrect == true {
                InCorrectAttempts += 1
            }
            else
             { correctAttempts += 1 }
        }
        self.questionSerialNumber += 1
        
//        if InCorrectAttempts >= 3 {
//           finshedGame?()
//        }
//        if  (questionSerialNumber) == (displayWordsList.count) {
//            finshedGame?()
//        }

    }
    
}
