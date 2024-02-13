//
//  StartButtonView.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//

import SwiftUI

struct StartButtonView: View {
    @Binding var tabSelection: Int;

    var index: Int;
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    // MARK: - BODY
    
    var body: some View {
      Button(action: {
          if(index == onboardingCardsList.count - 1) {
              isOnboarding = false
          }
          else {
              withAnimation {
                  tabSelection += 1
              }
          }
      }) {
        HStack(spacing: 8) {
          Text("Start")
          
          Image(systemName: "arrow.right.circle")
            .imageScale(.large)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
          Capsule().strokeBorder(Color.white, lineWidth: 1.25)
        )
      } //: BUTTON
      .accentColor(Color.white)
    }
}

#Preview {
    StartButtonView(tabSelection: .constant(0), index: 0)
}
