//
//  WordModel.swift
//  FindMyWord
//
//  Created by Shibanee Mishra on 27/07/22.
//

import UIKit

struct WordModel: Decodable, Equatable {
    let eng: String
    let spa: String

    // MARK: Decodable
    private enum CodingKeys: String, CodingKey {
        case eng = "text_eng"
        case spa = "text_spa"
    }
}
