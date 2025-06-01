//
//  Stepper.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 27.02.2024.
//

import SwiftUI

private let purple = Color(#colorLiteral(red: 0.4274509804, green: 0.4470588235, blue: 0.9960784314, alpha: 1))

struct Stepper: View {
    @Binding var wordLength: Int
    @State private var dragWidth: CGFloat = 0
    var size: CGFloat = 48
    var minNumber: Int = 4
    var maxNumber: Int = 6
    

    private func isMin() -> Bool {
        return wordLength == minNumber
    }
    
    private func isMax() -> Bool {
        return wordLength == maxNumber
    }
    
    private func shouldDecrease() -> Bool {
        return dragWidth < -size / 2.4
    }
    
    private func shouldIncrease() -> Bool {
        return dragWidth > size / 2.4
    }
    
    private func decrease() {
        if !isMin() {
            wordLength -= 1
        }
    }
    
    private func increase() {
        if !isMax() {
            wordLength += 1
        }
    }
    
    private func icon(systemName: String) -> some View {
        return Image(systemName: systemName)
            .font(.system(size: size / 3.75))
            .foregroundColor(.white)
            .frame(width: size / 2)
            .frame(maxHeight: .infinity)
            .contentShape(Rectangle())
    }
    
    private let spring = Animation.spring(response: 0.4, dampingFraction: 0.6)
    
    var body: some View {
        ZStack {
            HStack {
                icon(systemName: "minus")
                    .opacity(isMin() ? 0.4 : 1)
                    .animation(.linear)
                    .onTapGesture {
                        decrease()
                    }
                
                Spacer()
                
                icon(systemName: "plus")
                    .opacity(isMax() ? 0.4 : 1)
                    .animation(.linear)
                    .onTapGesture {
                        increase()
                    }
            }
            .padding(.horizontal, 5)
            .frame(width: size * 2.2, height: size)
            .background(
                Capsule()
                    .fill(Color.white.opacity(0.25))
            )
            
            Text("\(wordLength)")
                .font(.system(size: size / 2.25, weight: .bold))
                //.foregroundColor(purple)
                .frame(width: size, height: size)
                .background(
                    Circle()
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 0)
                )
                .offset(x: dragWidth)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let absoluteWidth = abs(dragWidth)
                            let threshold = size / 2 * 1.7
                            
                            if absoluteWidth < threshold {
                                withAnimation(spring) {
                                    if (isMin() && value.translation.width < 0) || (isMax() && value.translation.width > 0) {
                                        dragWidth = value.translation.width * 0.1
                                    } else {
                                        dragWidth = value.translation.width * max((threshold + size / 2 - absoluteWidth) / 100, 0.1) * 0.8
                                    }
                                }
                            }
                        }
                        .onEnded { _ in
                            if shouldIncrease() {
                                increase()
                            } else if shouldDecrease() {
                                decrease()
                            }
                            
                            withAnimation(spring) {
                                dragWidth = .zero
                            }
                        }
                )
        }
        .clipShape(Capsule())
    }
}

struct Stepper_Previews: PreviewProvider {
    static var previews: some View {
         ZStack {
             purple.ignoresSafeArea()
             //Stepper(wordLength: 4, minNumber: 4, maxNumber: 6)
         }
     }
}
