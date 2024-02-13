//
//  OnboardingView.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//

import SwiftUI

struct OnBoardingView: View {
    // MARK: - PROPERTIES
    
    var fruits: [OnboardingCardModel] = onboardingCardsList

    @State private var tabSelection = 0

    
    // MARK: - BODY
    
    var body: some View {
        TabView(selection: $tabSelection) {
          ForEach(0..<fruits.count, id: \.self) { item in
              OnboardingCardView(onboardingCards: onboardingCardsList[item],index: item,tabSelection: $tabSelection)
                  .tag(item)
        } //: LOOP
      } //
    
//      .animation(.easeInOut)
      .transition(.slide)
      .tabViewStyle(PageTabViewStyle())
      .padding(.vertical, 20)
    }

}

#Preview {
    OnBoardingView()
}
