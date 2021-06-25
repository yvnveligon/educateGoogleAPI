
//
//  TraslateWordViewModel.swift
//  educateGoogleAPI
//
//  Created by Рома Велигон on 26.02.2021.
//

import Foundation


struct WordsDetail: Codable, Identifiable {
    let id:Int?
    let data: Data?

    
    static var placeholder: Self {
        return WordsDetail(id: nil, data: nil)
    }
}


struct Translations: Codable {
     
    let translatedText: String?
    let model: String?
    
}


struct Data: Codable {
    let translations: [Translations]?
}
