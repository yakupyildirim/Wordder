// last
//  Onboarding.swift
//  Meditation
//
//  Created by yusuf on 22.12.2023.
//

import SwiftUI

struct Onboarding: View {
    @State private var pageIndex = 0
    private let pages: [OnboardingModel] = OnboardingModel.onboardingPages
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [Color("backgroundBlueTop"), Color("backgroundBlueBottom")]), startPoint: .top, endPoint: .bottom)
                
                
                    TabView(selection: $pageIndex) {
                        ForEach(pages) { page in
                            VStack {
                                OnboardingItem(onboardingModel: page)
                            }.tag(page.tag)
                        }
                        
                    }
                    .animation(.easeInOut, value: pageIndex)
                    .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                    .tabViewStyle(PageTabViewStyle())
                    .onAppear {
                        setupAppearance()
                    }
                    
                    VStack(){
                        Image("onboarding_bottom")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        VStack{
                            if pageIndex == pages.count - 1 {
                                NavigationLink {
                                    Menu()
                                } label: {
                                    Text("GET STARTED").ContinueButtonStyle(Color("continueBackground"), Buttons.width.started.rawValue)
                                }
                            } else {
                                Button(action: { pageIndex += 1 },
                                       label: {
                                    Text("CONTINUE").ContinueButtonStyle(Color("continueBackground"), Buttons.width.started.rawValue)
                                })
                            }
                            
                            
                            
                            NavigationLink {
                                Menu()
                            } label: {
                                Text("Skip")
                                    .foregroundColor(.black)
                                    .font(.body)
                                    .bold()
                                    .frame(width: 50, height: 26)
                                    .background(Color("skipBackground"))
                                    .cornerRadius(8)
                                
                            }
                            
                        }.padding([.top], 250)
                    }
                    
           
                
                
            }.ignoresSafeArea()
        }.navigationBarBackButtonHidden(true)
    }
}

func setupAppearance() {
    UIPageControl.appearance().currentPageIndicatorTintColor = .black
    UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
  }




struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
