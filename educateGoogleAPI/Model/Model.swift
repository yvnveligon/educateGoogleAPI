

import Foundation


struct WordsDetail: Codable, Identifiable {
    let id:Int?
    let data: Data?

    
    static var placeholder: Self {
        return WordsDetail(id: nil, data: nil)
    }
}

// MARK: - Coord
struct Translations: Codable {
     
    let translatedText: String?
    let model: String?
    
}

// MARK: - Main
struct Data: Codable {
    let translations: [Translations]?
}
