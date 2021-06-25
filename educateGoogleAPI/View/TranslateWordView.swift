//
//  TranslateWordView.swift
//  educateGoogleAPI
//
//  Created by Рома Велигон on 26.02.2021.
//

import SwiftUI

struct TranslateWordView: View {
    //@ObservedObject var model = TempViewModel()
    
    @ObservedObject var traslateWordViewModel = TraslateWordViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Translate")
                .font(.largeTitle)
            
//            TextField("Enter word", text: self.$model.wordInput)
//                .autocapitalization(.words)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .background(
//                    RoundedRectangle(cornerRadius: 10, style: .continuous)
//                )
//                .accentColor(.blue)
            
            TextField("test combine", text: self.$traslateWordViewModel.wordInput)
                .autocapitalization(.words)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                )
                .accentColor(.blue)
            
           // Text(model.currentWord.data?.translations?.first?.translatedText ?? "")
            
            Text(traslateWordViewModel.currentWord.data?.translations?.first?.translatedText ?? "")
            
            


            Spacer()
            
            Button("ADD"){
             
            }
            
            }
        
        .font(.title)
        .padding()
    }
}

struct TranslateWordView_Previews: PreviewProvider {
    static var previews: some View {
        TranslateWordView()
    }
}
