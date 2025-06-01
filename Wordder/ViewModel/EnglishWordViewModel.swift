//
//  EnglishWordsViewModel.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 8.01.2024.
//

import SwiftUI
import Combine

class EnglishViewModel: ObservableObject {
    @Published var word: String?
    @Published var characterList : [SquareModel]? = []
    @Published var isActive: Bool = false
    @Published var words: [WordsModel]?///get json
    @Published var timeRemaning: Float = 20.0
    @Published var progress: Float = 0
    @Published var score: Int = 0
    
    var cancelable: Set<AnyCancellable> = []
    let languageId: Int = 1
    
    
    var everySecTimer = Timer.publish(every: 1, tolerance: 1, on: .main, in: .common).autoconnect()
    
    func stopTimer() {
        everySecTimer.upstream.connect().cancel()
    }
      
    func startTimer() {
        everySecTimer = Timer.publish(every: 1, tolerance: 1, on: .main, in: .common).autoconnect()
    }
    

    func getEnglishWords() {
        APIClient.dispatch(APIRouter.GetEnglishWords())
        .sink { _ in }
        receiveValue: { [weak self] englishWordModel in
            Log.info("englishWordModel-> \(englishWordModel)")
            self?.word = englishWordModel.first?.uppercased() ?? ""
            self?.isActive = true
            
            for letter in self!.word! {
                let squareModel = SquareModel(character: String(letter), backgroundColor: .white, borderColor: Color.black, isActive: true)
                self!.characterList!.append(squareModel)
            }
        }
        .store(in: &cancelable)
    }
    
    func getEnglishWordsJson(wordLength: Int) {
        print("wordLength: \(wordLength)")
        print("geldi1")
        
        
        self.score = 0 //get
        
        guard let url = Bundle.main.url(forResource: "db", withExtension: "json")
        else {
                print("Json file not found")
                return
        }
        let data = try? Data(contentsOf: url)
        let words = try? JSONDecoder().decode([WordsModel].self, from: data!)
        self.words = words!.filter { $0.length == wordLength && $0.languageId == languageId}
        let randomInt = Int.random(in: 0..<self.words!.count)
        self.word = self.words?[randomInt].word.uppercased()
        self.characterList! = []
        for letter in self.word! {
            let squareModel = SquareModel(character: String(letter), backgroundColor: .white, borderColor: Color.black, isActive: true)
            self.characterList!.append(squareModel)
        }
        
    }
}
