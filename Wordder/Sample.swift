//
//  Sample.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 5.01.2024.
//

import SwiftUI

struct TextTransitionSample: View {
    @State private var textValue: Int = 1
    @State private var opacity: Double = 1
    var body: some View {
        VStack (spacing: 50) {
            Text("\(textValue)")
                .font(.largeTitle)
                .frame(width: 200, height: 200)
                .opacity(opacity)
            Button("Next") {
                withAnimation(.easeInOut(duration: 0.5), {
                    self.opacity = 0
                })
                self.textValue += 1
                withAnimation(.easeInOut(duration: 1), {
                    self.opacity = 1
                })
            }
        }
    }
}

struct TextTransitionSample_Previews: PreviewProvider {
    static var previews: some View {
        TextTransitionSample()
    }
}
