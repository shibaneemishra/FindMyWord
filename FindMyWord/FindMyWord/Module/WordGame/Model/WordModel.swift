//
//  WordModel.swift
//  FindMyWord
//
//  Created by Shibanee Mishra on 27/07/22.
//

import UIKit

struct WordModel: Decodable, Equatable {
    let english: String
    let spanish: String

    // MARK: Decodable
    private enum CodingKeys: String, CodingKey {
        case english = "text_eng"
        case spanish = "text_spa"
    }
}

