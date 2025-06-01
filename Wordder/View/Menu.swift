//
//  Menu.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 18.02.2024.
//

import SwiftUI
import AVFoundation
import Combine

struct Menu: View {
    @ObservedObject var viewModel: EnglishViewModel = EnglishViewModel()
    @State private var wordLength: Int = 4
    @State private var isTabToStart: Bool = false
    @State private var timeIsOver = false
    @State private var isWordCorrect = false
    @State private var buttonIsActive = false
    @State private var wordGuess: String = ""
    @State private var writingIndex: Int = -1
    @State private var randomIndex: Int = 0
    @State private var squareTimer = Timer.publish(every: 1.5, on: .main, in: .common)
    @State private var squareTimerCancellable: Cancellable?

    var body: some View {
        NavigationStack {
            ZStack {
            
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 28/255, green: 40/255, blue: 89/255),   // Orta koyu mavi
                        Color(red: 71/255, green: 53/255, blue: 133/255)   // Açık mor
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                
                
                VStack {
                    // Header
                    HStack {
                        Button(action: {
                            Audio.playSound("buttonClick3")
                            GotoMenuClear()
                        }) {
                            
                            if !isTabToStart {
                                Image(systemName: "info.circle")
                                    .font(.system(size: 30, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding()
                            }else{
                                Image("home")
                                    .font(.system(size: 30, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                
                        }

                        Spacer()

                        HStack(spacing: 8) {
                            Text("0")
                                .font(.system(size: 36, weight: .light))
                                .foregroundColor(.white)
                            Capsule()
                                .fill(Color.red)
                                .frame(width: 10, height: 30)
                        }
                        .padding()
                        
                    }
                    .padding(.top, 40)

                    Spacer()

                    // Game start / Game screen
                    if !isTabToStart {
                        VStack {
                            Button(action: {
                                Audio.playSound("buttonClick3")
                                viewModel.getEnglishWordsJson(wordLength: wordLength)
                                StartTimer()
                                isTabToStart = true
                            }) {
                                TapToStart()
                            }

                            BottomMenu(wordLength: $wordLength)
                                .padding(.bottom, 30)
                        }
                    } else {
                        // Timer & Progress
                        HStack {
                            Counter(timeRemaning: $viewModel.timeRemaning, progress: $viewModel.progress)
                                .onReceive(viewModel.everySecTimer) { _ in
                                    viewModel.timeRemaning -= 1
                                    viewModel.progress = Float(1 - (viewModel.timeRemaning / 20.0))
                                }
                                .sheet(isPresented: $timeIsOver) {
                                    FailSheet()
                                        .onAppear {
                                            Audio.playSound("unSuccess")
                                            gotoMenu(time: 3)
                                        }
                                }
                        }
                        .padding(.horizontal, 64)

                        Spacer()

                        // Word Squares
                        if let characterList = viewModel.characterList {
                            VStack {
                                HStack(spacing: 8) {
                                    ForEach(characterList, id: \.self) { characterModel in
                                        SquareItem(model: characterModel)
                                    }
                                }
                                .onReceive(squareTimer) { _ in
                                    GenerateRandomCharacter()
                                }
                            }
                        }

                        Spacer()

                        // Keyboard
                        VStack {
                            ForEach(Constants.englishButtons, id: \.self) { row in
                                HStack {
                                    ForEach(row, id: \.self) { button in
                                        Button(action: {
                                            Audio.playSound("keyboard")
                                            button == "DELETE" ? Delete() : Add(key: button)
                                        }) {
                                            KeyboardButton(key: button)
                                        }
                                    }
                                }
                            }

                            Button(action: {
                                Audio.playSound("space")
                                Submit()
                            }) {
                                SubmitButton(key: "ENTER", backgroundColor: .cyan, letterColor: .black)
                            }
                            .disabled(!buttonIsActive)
                            .sheet(isPresented: $isWordCorrect) {
                                SuccessSheet()
                                    .onAppear {
                                        Audio.playSound("success")
                                        gotoMenu(time: 3)
                                    }
                            }
                        }
                        .padding(.bottom, 60)
                    }
                }
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }

    // MARK: - Functions

    func gotoMenu(time: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            GotoMenuClear()
        }
    }

    func GenerateRandomCharacter() {
        guard viewModel.timeRemaning > 0,
              let word = viewModel.word,
              let characterList = viewModel.characterList else {
            PaintAllSquare(.red, writeCorrectWord: true)
            timeIsOver = true
            StopTimer()
            return
        }

        Clear()

        let randomChar = String(word.randomElement()!)
        randomIndex = Int.random(in: 0..<characterList.count)
        viewModel.characterList?[randomIndex].guessCharacter = randomChar
        viewModel.characterList?[randomIndex].backgroundColor =
            randomChar == characterList[randomIndex].character ? .green : .yellow
    }

    func Submit() {
        guard let characterList = viewModel.characterList else { return }

        wordGuess = characterList.map { $0.guessCharacter }.joined()

        if viewModel.word == wordGuess {
            isWordCorrect = true
            PaintAllSquare(.green, writeCorrectWord: false)
        } else {
            PaintAllSquare(.red, writeCorrectWord: false)
        }
    }

    func GotoMenuClear() {
        timeIsOver = false
        isWordCorrect = false
        StopTimer()
        viewModel.timeRemaning = 20
        viewModel.progress = 0
        isTabToStart = false
        writingIndex = -1
    }

    func Clear() {
        guard viewModel.characterList?.indices.contains(randomIndex) == true else { return }
        viewModel.characterList?[randomIndex].guessCharacter = ""
        viewModel.characterList?[randomIndex].backgroundColor = .white
    }

    func Delete() {
        guard writingIndex >= 0,
              viewModel.characterList?.indices.contains(writingIndex) == true,
              viewModel.characterList?[writingIndex].guessCharacter != "" else { return }

        viewModel.characterList?[writingIndex].guessCharacter = ""
        viewModel.characterList?[writingIndex].backgroundColor = .white

        if writingIndex == 0 {
            StartTimer()
        }

        writingIndex -= 1
        buttonIsActive = false
        PaintAllSquare(.white, writeCorrectWord: false)
    }

    func Add(key: String) {
        guard let characterList = viewModel.characterList,
              writingIndex < characterList.count - 1 else { return }

        writingIndex += 1
        if writingIndex == 0 {
            Clear()
            StopTimer()
        }
        viewModel.characterList?[writingIndex].guessCharacter = key

        IsSubmitButtonActive()
    }

    func IsSubmitButtonActive() {
        guard let characterList = viewModel.characterList else {
            buttonIsActive = false
            return
        }
        buttonIsActive = (writingIndex + 1 == characterList.count)
    }

    func StartTimer() {
        squareTimer = Timer.publish(every: 1.5, on: .main, in: .common)
        squareTimerCancellable = squareTimer.connect()
        viewModel.startTimer()
    }

    func StopTimer() {
        squareTimerCancellable?.cancel()
        squareTimerCancellable = nil
        viewModel.stopTimer()
    }

    func PaintAllSquare(_ color: Color, writeCorrectWord: Bool) {
        guard let characterList = viewModel.characterList else { return }

        for i in 0..<characterList.count {
            viewModel.characterList?[i].backgroundColor = color
            if writeCorrectWord {
                viewModel.characterList?[i].guessCharacter = characterList[i].character
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
