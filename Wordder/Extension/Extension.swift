//
//  Extension.swift
//  Meditation
//
//  Created by yusuf on 1.01.2024.
//

//
//  Extension.swift
//  Meditation
//
//  Created by yusuf on 1.01.2024.
//

import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

extension Text{
    func LoginButtonStyle() -> some View{
        self.frame(maxWidth:UIScreen.screenWidth, maxHeight: 50)
            .foregroundColor(.white)
            .font(.body)
            .padding(.horizontal)
            .background(Color("ThyRed"))
            .cornerRadius(30)
    }
    
    func generalButtonStyle(color: String) -> some View{
        self.frame(maxWidth: 150, maxHeight: 50)
            .foregroundColor(.white)
            .font(.body)
            .padding(.horizontal)
            .background(Color(color))
            .cornerRadius(10)
    }
    
    func ContinueButtonStyle(_ color: Color, _ width: CGFloat) -> some View{
        self.frame(maxWidth: width, maxHeight: Buttons.height.standart.rawValue)
            .foregroundColor(.black)
            .font(.body)
            .padding(.horizontal)
            .background(color)
            .cornerRadius(4)
            .bold()
    }
    
    
    
}



extension Image{
    func ProjectIconStyle() -> some View{
        self.resizable()
            .frame(width: UIScreen.screenWidth/2.2, height: UIScreen.screenHeight/4.5)
            .padding(.vertical, 6)
    }
}



extension Divider{
    func UnderLineTextFieldStyle() -> some View{
        self.frame(height: 1.5)
            .background(.white)
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

extension Encodable {
    var asDictionary: [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }

        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            return [:]
        }
        return dictionary
    }
}


