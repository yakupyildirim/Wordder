//
//  Timer.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 16.01.2024.
//

import SwiftUI

struct Counter: View {
    
    @Binding var timeRemaning: Float
    @Binding var progress: Float
    let lineWidth: CGFloat = 12
    let frameSize: CGFloat = 100
    let textSize: CGFloat = 32
    
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.4)
                .foregroundColor(.gray)
            
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: lineWidth))
                .overlay(content: {
                    AngularGradient(gradient: Gradient(colors: [.green]), center: .center)
                        .mask {
                            Circle()
                                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                        }
                })
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.spring(), value: progress)
            
            Text("\(max("0", timeRemaning.formatted()))")
                .font(.system(size: textSize, weight: .semibold))
                .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 2)
                .foregroundColor(.white)
            
        }.frame(width: frameSize, height: frameSize)
    }
}

struct Counter_Previews: PreviewProvider {
    static var previews: some View {
        Counter(timeRemaning: .constant(10), progress: .constant(0.370))
    }
}
