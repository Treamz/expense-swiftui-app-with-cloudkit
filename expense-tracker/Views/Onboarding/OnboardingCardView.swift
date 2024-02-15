//
//  OnboardingCardView.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//

import SwiftUI

struct OnboardingCardView: View {
    
    var onboardingCards : OnboardingCardModel
    var index: Int;
    @Binding var tabSelection: Int;
    
    @State private var isAnimating: Bool = false

    
    var body: some View {
        ZStack {
              VStack(spacing: 20) {
                // FRUIT: IMAGE
                Image(onboardingCards.image)
                  .resizable()
                  .scaledToFit()
                  .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                  .scaleEffect(isAnimating ? 0.9 : 0.6)
                
                // FRUIT: TITLE
                Text(onboardingCards.title)
                  .foregroundColor(Color.white)
                  .font(.largeTitle)
                  .fontWeight(.heavy)
                  .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                
                // FRUIT: HEADLINE
                Text(onboardingCards.headline)
                  .foregroundColor(Color.white)
                  .multilineTextAlignment(.center)
                  .padding(.horizontal, 16)
                  .frame(maxWidth: 480)
                
                // BUTTON: START
                  
                  StartButtonView(tabSelection: $tabSelection, index: index)
              } //: VSTACK
            } //: ZSTACK
            .onAppear {
              withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
              }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: onboardingCards.gradientColors), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
            .padding(.horizontal, 20)
          }
    
}

#Preview {
    OnboardingCardView(onboardingCards: onboardingCardsList[3],index: 0,tabSelection: .constant(0))
}
