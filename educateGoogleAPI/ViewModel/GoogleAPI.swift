//
//  TraslateWordViewModel.swift
//  educateGoogleAPI
//
//  Created by Рома Велигон on 26.02.2021.
//

import Foundation
import Combine

class GoogleAPI {
    static let shared = GoogleAPI()
    
    private let baseaseURL = "https://translation.googleapis.com/language/translate/v2"
    
    private let apiKey = ""
    
    private var coounter = 0
    
    private func absoluteURL(_ q: String, _ target: String = "en", _ source: String = "ru", _ format: String = "text", _ model: String = "base") -> URL? {
        let queryURL = URL(string: baseaseURL)!
        let components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
        guard var urlComponents = components else { return nil}
        urlComponents.queryItems = [URLQueryItem(name: "key", value: apiKey),
                                    URLQueryItem(name: "q", value: q),
                                    URLQueryItem(name: "target", value: target),
                                    URLQueryItem(name: "source", value: source),
                                    URLQueryItem(name: "format", value: format),
                                    URLQueryItem(name: "model", value: model),
        ]
        
        return urlComponents.url
    }
    

    
    func fetchWordTranslate(for enterWord: String) -> AnyPublisher<WordsDetail, Never> {
        guard let url = absoluteURL(enterWord) else {

            return Just(WordsDetail.placeholder)
                .eraseToAnyPublisher()
        }
        
        return
            
           
            URLSession.shared.dataTaskPublisher(for:url)                  // 2
                .map { $0.data }                                          // 3
                .decode(type: WordsDetail.self, decoder: JSONDecoder()) // 4
                .catch { error in Just(WordsDetail.placeholder)}        // 5
                .receive(on: RunLoop.main)                                // 6
                .eraseToAnyPublisher()                                    // 7
    }
    
    
}

