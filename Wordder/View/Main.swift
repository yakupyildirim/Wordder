//
//  Square.swift
//  Wordder
//
//  Created by yusuf on 3.01.2024.
//
/*
import SwiftUI

struct Main: View {
    @ObservedObject var viewModel: EnglishViewModel = EnglishViewModel()
    @State var wordGuess: String = ""
    @State var writingIndex: Int = -1
    @State var randomIndex: Int = 0
    @State var squareTimer: Timer.TimerPublisher = Timer.publish(every: 1.5, on: .main, in: .common)
    @State var timeIsOver = false
    @State var isWordCorrect = false
    @State var buttonIsActive = false
    var wordLength: Int = 5

    init(wordLength: Int){
        self.wordLength = wordLength
        viewModel.getEnglishWordsJson(wordLength: wordLength)
        StartTimer()
    }

    var body: some View {
        NavigationStack{
            ZStack{
                
                
                Color.navi
                
                
                if viewModel.isActive{
                    ZStack{
                        HStack{
                            NavigationLink {
                                Menu().onAppear {
                                    self.StopTimer()
                                }
                            } label: {
                                Image("back")
                            }
                            Spacer() 
                        }.padding([.top], -200)
                        
                        HStack{
                            Counter(timeRemaning: $viewModel.timeRemaning, progress: $viewModel.progress)
                                .onReceive(viewModel.everySecTimer) { _ in
                                    viewModel.timeRemaning -= 1
                                    viewModel.progress = Float(1 - (viewModel.timeRemaning / 20.0))
                                    
                                }.sheet(isPresented: $timeIsOver, content: {
                                    FailSheet(Restart: {self.Restart()})
                                })
                            
                        }.padding(.horizontal, 64)
                    }.padding([.top], -240)
                    
                    
                    VStack{
                        HStack(spacing: 8){
                            ForEach(viewModel.characterList!, id: \.self){ characterModel in
                                SquareItem(model: characterModel)
                            }
                            
                        }.onReceive(squareTimer) { time in
                            GenerateRandomCharacter()
                        }
                    }
                    
                    VStack{
                        ForEach(Constants.englishButtons, id: \.self){ row in
                            HStack{
                                ForEach(row, id: \.self){ button in
                                    Button(action: {
                                        button == "DELETE" ? Delete() : Add(key: button)
                                    }, label: {
                                        KeyboardButton(key: button)
                                    })
                                }
                            }
                        }
                        
                        
                        Button(action: {
                            Submit()
                        }, label: {
                            SubmitButton(key: "ENTER", backgroundColor: .cyan, letterColor: .black)
                        })
                        .disabled(!buttonIsActive)
                        .sheet(isPresented: $isWordCorrect, content: {
                            SuccessSheet(Restart: {self.Restart()})
                        })
                        
                    }.padding([.top], 490)
                }else{
                    ProgressView()
                        .tint(.white)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
            }.ignoresSafeArea()
        }.navigationBarBackButtonHidden(true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func GenerateRandomCharacter(){
        if viewModel.timeRemaning == 0 {
            PaintAllSquare(.red, true)
            timeIsOver = true
            StopTimer()
        }else{
            Clear()
             let randomChar = String(viewModel.word!.randomElement()!)
             randomIndex = Int.random(in: 0..<viewModel.characterList!.count)
             viewModel.characterList![randomIndex].guessCharacter = randomChar
             viewModel.characterList![randomIndex].backgroundColor = randomChar == viewModel.characterList![randomIndex].character ? Color.green : Color.yellow
        }
    }
    
    
    
    func Submit() {
        wordGuess = ""
        for i in 0..<viewModel.characterList!.count {
           wordGuess += viewModel.characterList![i].guessCharacter
        }
        
        if viewModel.word == wordGuess{
            isWordCorrect = true
            PaintAllSquare(.green, false)
        }else{
            PaintAllSquare(.red, false)
        }
    }
    
    func Restart() {
        writingIndex = -1
        buttonIsActive = false
        viewModel.timeRemaning = 20
        viewModel.progress = 0
        timeIsOver = false
        isWordCorrect = false
        viewModel.getEnglishWordsJson(wordLength: wordLength)
        StartTimer()
    }
    
    
    func Clear(){
        viewModel.characterList![randomIndex].guessCharacter = ""
        viewModel.characterList![randomIndex].backgroundColor = .white
    }
    
    func Delete(){
        if writingIndex >= 0 && viewModel.characterList![writingIndex].guessCharacter != ""{
            viewModel.characterList![writingIndex].guessCharacter = ""
            viewModel.characterList![writingIndex].backgroundColor = .white
            if writingIndex == 0{
                StartTimer()
            }
            writingIndex -= 1
            buttonIsActive = false
        }
    }
    
    
    func Add(key: String){
        if writingIndex < viewModel.characterList!.count - 1 {
            writingIndex += 1
            if writingIndex == 0 {
                Clear()
                StopTimer()
            }
            viewModel.characterList![writingIndex].guessCharacter = key
        }
        
        IsSubmitButtonActive();
    }
    
    func IsSubmitButtonActive(){
        if writingIndex + 1 == viewModel.characterList!.count{
            buttonIsActive = true
        }else{
            buttonIsActive = false
        }
    }
    
    func StartTimer() {
        squareTimer = Timer.publish(every: 1.5, on: .main, in: .common)
        _ = squareTimer.connect()
        viewModel.startTimer()
    }
    
    func StopTimer() {
        squareTimer.connect().cancel()
        viewModel.stopTimer()
    }
    
    func PaintAllSquare(_ color: Color, _ writeCorrectWord: Bool ){
        for i in 0..<viewModel.characterList!.count {
            viewModel.characterList![i].backgroundColor = color
            if writeCorrectWord{
                viewModel.characterList![i].guessCharacter = viewModel.characterList![i].character
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main(wordLength: 4)
    }
}
*/
