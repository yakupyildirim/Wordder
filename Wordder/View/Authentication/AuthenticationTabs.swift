//
//  AuthenticationTabs.swift
//  Meditation
//
//  Created by yusuf on 1.01.2024.
//
/*
import SwiftUI

struct AuthenticationTabs: View {
    
    var fixed = true
    var geoWidth: CGFloat
    private let tabs: [AuthenticationTabModel] = AuthenticationTabModel.authenticationTabModels
    @Binding var selectedTab: Int

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0 ..< tabs.count, id: \.self) { row in
                        Button(action: {
                            withAnimation {
                                selectedTab = row
                            }
                        }, label: {
                            VStack(spacing: 0) {
                                HStack {
                                    
                                    // Image
                                    /*
                                    AnyView(tabs[row].icon)
                                        .foregroundColor(.black)
                                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                                    */
                                    
                                    // Text
                                    Text(tabs[row].title)
                                        .font(Font.system(size: 18, weight: .semibold))
                                        .foregroundColor(Color.black)
                                        .padding(EdgeInsets(top: 10, leading: 3, bottom: 10, trailing: 15))
                                }
                                .frame(width: fixed ? (geoWidth / CGFloat(tabs.count)) : .none, height: 52)
                                // Bar Indicator
                                Rectangle()
                                    .fill(selectedTab == row ? Color.black : Color.clear)
                                    .frame(height: 3)
                                
                            }.fixedSize()
                        })
                    }
            }
        }
        .onAppear(perform: {
    
        })
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = true
        })
    }
}

struct AuthenticationTabs_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationTabs(fixed: true,
                           geoWidth: 375,
                           selectedTab: .constant(0))
    }
}
*/
