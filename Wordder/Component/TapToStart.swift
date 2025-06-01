//
//  LogoAndTapToStart.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 29.02.2024.
//

import SwiftUI

struct TapToStart: View {
    var body: some View {
        VStack(alignment:.center, spacing: 100) {
            Image("logo") // Or custom shapes
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("TAP TO START")
                .font(.system(size: 32, weight: .semibold))
                .foregroundColor(.white)
                .padding(.top, 12)
            Spacer()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 700)
            
        }.contentShape(Rectangle())
    }
}

struct TapToStart_Previews: PreviewProvider {
    static var previews: some View {
        TapToStart().background(Color.navi)
    }
}
