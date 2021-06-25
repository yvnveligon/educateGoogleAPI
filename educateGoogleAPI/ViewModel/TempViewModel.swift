//
//  MoviesViewModel.swift
//  CombineFetchAPI
//
//  Created by Tatiana Kornilova on 28/10/2019.
//

import Combine
import Foundation

final class TempViewModel: ObservableObject {
    // input
    @Published var wordInput: String = ""
    @Published var count: Int = 0
    // output
    @Published var currentWord = WordsDetail.placeholder
    
    
    
    
    func requestToApi(wordInput:String)-> AnyPublisher <WordsDetail, Never>{
        self.count += 1
        print(self.count)
        return GoogleAPI.shared.fetchWordTranslate(for: wordInput)
    }
    

    init() {
            
        $wordInput
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { (wordInput:String) -> AnyPublisher <WordsDetail, Never> in
                self.requestToApi(wordInput: wordInput)
              }
            .assign(to: \.currentWord , on: self)
            .store(in: &self.cancellableSet)
   }
    
    private var cancellableSet: Set<AnyCancellable> = []
}

   

