//
//  TraslateWordViewModel.swift
//  educateGoogleAPI
//
//  Created by Рома Велигон on 26.02.2021.
//

import Foundation
import Combine


class TraslateWordViewModel: ObservableObject{
    // input
    @Published var wordInput: String = ""
    @Published var count: Int = 0
    // output
    @Published var currentWord = WordsDetail.placeholder
    
    @Published var isValidInput = false
    @Published var lemitCounerApi = 0
    
    

    
    private var cansalables : Set<AnyCancellable> = []
    
    private var checkInput : AnyPublisher<Bool, Never>{
        $wordInput
            .delay(for: 0.9, scheduler: RunLoop.main)
            .removeDuplicates()
            .map {input in
                return input.count >= 1 && input.count <= 15}
           
            .eraseToAnyPublisher()
    
    }
    
    
    func requestToApi(wordInput:String)-> AnyPublisher <WordsDetail, Never>{
        self.count += 1
        print(self.count)
        return GoogleAPI.shared.fetchWordTranslate(for: wordInput)
    }
    


    
    

    
    
    
    init(){
       // $input
          //  .delay(for: 0.1, scheduler: RunLoop.main)
          //  .removeDuplicates()
           // .map {input in
             //   return input.count >= 1
                
           // }
        checkInput
            .receive(on: RunLoop.main)
            .assign(to: \.isValidInput , on: self)
            .store(in: &cansalables)
        
        $isValidInput
            .flatMap { (isValidInput:Bool) -> AnyPublisher <WordsDetail, Never> in
                switch isValidInput{
                
                case true:
                    return self.requestToApi(wordInput: self.wordInput)
                case false:
                    return Just(WordsDetail.placeholder)
                        .eraseToAnyPublisher()
                }
                
                //self.requestToApi(wordInput: self.wordInput)
                
              }
            .assign(to: \.currentWord , on: self)
            .store(in: &cansalables)
        

  
            
        
        
    }
    


    
    
    
}
