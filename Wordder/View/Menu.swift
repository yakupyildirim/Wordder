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
    @State private var gameState: GameStates = .idle
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
                        Color(red: 28/255, green: 40/255, blue: 89/255),
                        Color(red: 71/255, green: 53/255, blue: 133/255)
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
                            gotoMenuClear()
                        }) {
                            if gameState == .idle {
                                Image(systemName: "info.circle")
                                    .font(.system(size: 30, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding()
                            } else {
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

                    if gameState == .idle {
                        VStack {
                            Button(action: {
                                Audio.playSound("buttonClick3")
                                viewModel.getEnglishWordsJson(wordLength: wordLength)
                                startTimer()
                                gameState = .playing
                            }) {
                                TapToStart()
                            }

                            BottomMenu(wordLength: $wordLength)
                                .padding(.bottom, 30)
                        }
                    } else {
                        HStack {
                            Counter(timeRemaning: $viewModel.timeRemaning, progress: $viewModel.progress)
                                .onReceive(viewModel.everySecTimer) { _ in
                                    viewModel.timeRemaning -= 1
                                    viewModel.progress = Float(1 - (viewModel.timeRemaning / 20.0))
                                    if viewModel.timeRemaning <= 0 {
                                        gameState = .fail
                                    }
                                }
                                .sheet(isPresented: Binding(get: { gameState == .fail }, set: { _ in })) {
                                    FailSheet()
                                        .onAppear {
                                            
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                Audio.playSound("unSuccess")
                                            }
                                            
                                            gotoMenu(after: 3)
                                        }
                                    
                                    
                                }
                        }
                        .padding(.horizontal, 64)

                        Spacer()

                        if let characterList = viewModel.characterList {
                            VStack {
                                HStack(spacing: 8) {
                                    ForEach(characterList, id: \.self) { characterModel in
                                        SquareItem(model: characterModel)
                                    }
                                }
                                .onReceive(squareTimer) { _ in
                                    generateRandomCharacter()
                                }
                            }
                        }

                        Spacer()

                        VStack {
                            ForEach(Constants.englishButtons, id: \.self) { row in
                                HStack {
                                    ForEach(row, id: \.self) { button in
                                        Button(action: {
                                            Audio.playSound("keyboard")
                                            button == "DELETE" ? delete() : add(key: button)
                                        }) {
                                            KeyboardButton(key: button)
                                        }
                                    }
                                }
                            }

                            Button(action: {
                                Audio.playSound("space")
                                submit()
                            }) {
                                SubmitButton(key: "ENTER", backgroundColor: .cyan, letterColor: .black)
                            }
                            .disabled(!buttonIsActive)
                            .sheet(isPresented: Binding(get: { gameState == .success }, set: { _ in })) {
                                SuccessSheet()
                                    .onAppear {
                                        withAnimation(.easeInOut(duration: 0.2)) {
                                            Audio.playSound("success")
                                        }
                                        gotoMenu(after: 3)
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

    // MARK: - Game Logic

    func gotoMenu(after time: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            gotoMenuClear()
        }
    }

    func generateRandomCharacter() {
        guard gameState == .playing,
              let word = viewModel.word,
              let characterList = viewModel.characterList else {
            paintAllSquares(.red, revealCorrectWord: true)
            gameState = .fail
            stopTimer()
            return
        }

        clear()
        let randomChar = String(word.randomElement()!)
        randomIndex = Int.random(in: 0..<characterList.count)
        viewModel.characterList?[randomIndex].guessCharacter = randomChar
        viewModel.characterList?[randomIndex].backgroundColor =
            randomChar == characterList[randomIndex].character ? .green : .yellow
    }

    func submit() {
        guard let characterList = viewModel.characterList else { return }
        wordGuess = characterList.map { $0.guessCharacter }.joined()

        if viewModel.word == wordGuess {
            gameState = .success
            paintAllSquares(.green, revealCorrectWord: false)
        } else {
            paintAllSquares(.red, revealCorrectWord: false)
        }
    }

    func gotoMenuClear() {
        gameState = .idle
        stopTimer()
        viewModel.timeRemaning = 20
        viewModel.progress = 0
        writingIndex = -1
    }

    func clear() {
        guard viewModel.characterList?.indices.contains(randomIndex) == true else { return }
        viewModel.characterList?[randomIndex].guessCharacter = ""
        viewModel.characterList?[randomIndex].backgroundColor = .white
    }

    func delete() {
        guard writingIndex >= 0,
              viewModel.characterList?.indices.contains(writingIndex) == true,
              viewModel.characterList?[writingIndex].guessCharacter != "" else { return }

        viewModel.characterList?[writingIndex].guessCharacter = ""
        viewModel.characterList?[writingIndex].backgroundColor = .white

        if writingIndex == 0 {
            startTimer()
        }

        writingIndex -= 1
        buttonIsActive = false
        paintAllSquares(.white, revealCorrectWord: false)
    }

    func add(key: String) {
        guard let characterList = viewModel.characterList,
              writingIndex < characterList.count - 1 else { return }

        writingIndex += 1
        if writingIndex == 0 {
            clear()
            stopTimer()
        }
        viewModel.characterList?[writingIndex].guessCharacter = key
        updateSubmitButtonState()
    }

    func updateSubmitButtonState() {
        guard let characterList = viewModel.characterList else {
            buttonIsActive = false
            return
        }
        buttonIsActive = (writingIndex + 1 == characterList.count)
    }

    func startTimer() {
        squareTimer = Timer.publish(every: 1.5, on: .main, in: .common)
        squareTimerCancellable = squareTimer.connect()
        viewModel.startTimer()
    }

    func stopTimer() {
        squareTimerCancellable?.cancel()
        squareTimerCancellable = nil
        viewModel.stopTimer()
    }

    func paintAllSquares(_ color: Color, revealCorrectWord: Bool) {
        guard let characterList = viewModel.characterList else { return }
        for i in 0..<characterList.count {
            viewModel.characterList?[i].backgroundColor = color
            if revealCorrectWord {
                viewModel.characterList?[i].guessCharacter = characterList[i].character
            }
        }
    }
}

enum GameStates {
    case idle, playing, success, fail
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
