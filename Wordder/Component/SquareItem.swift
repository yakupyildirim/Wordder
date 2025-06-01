//
//  SquareItem.swift
//  Wordder
//
//  Created by yusuf on 4.01.2024.
//

import SwiftUI

struct SquareItem: View {
    let model: SquareModel
    @State var with: CGFloat = 52
    @State var height: CGFloat = 52

    init(model: SquareModel){
        self.model = model
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: self.with, height: self.height)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(model.backgroundColor)
                .border(model.borderColor, width: 1.8)
            Text(model.guessCharacter)
                .font(.title)
                .bold()
                .foregroundColor(.black)
        }
    }
}


struct SquareItem_Previews: PreviewProvider {
    static var previews: some View {
        SquareItem(model: SquareModel())
    }
}
