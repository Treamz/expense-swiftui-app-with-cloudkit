//
//  OnboardingCardModel.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//

import Foundation
import SwiftUI

// MARK: - FRUITS DATA MODEL

struct OnboardingCardModel: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var image: String
  var gradientColors: [Color]
}


let onboardingCardsList: [OnboardingCardModel] = [
    OnboardingCardModel(
      title: "Simplify Your Finances",
      headline: "Take the first step towards financial freedom! With Quantix AI Expense Manager, tracking your daily expenses and income becomes effortless. Stay on top of your finances with just a few taps",
      image: "simplicity",
      gradientColors: [Color(.purple), Color(.pink)]
    ),
    OnboardingCardModel(
      title: "See Where Your Money Goes",
      headline: "Visualize your spending habits with beautiful charts and graphs. Understand where your money goes each month, and identify opportunities to save more.",
      image: "go",
      gradientColors: [Color(.blue), Color(.green)]
    ),
    OnboardingCardModel(
      title: "Budget Smarter",
      headline: "Set up personalized budgets for different categories and keep track of your progress in real-time. Quantix AI Expense Manager helps you stay within your limits and adjust your spending habits.",
      image: "budget",
      gradientColors: [Color(.red), Color(.orange)]
    ),
    OnboardingCardModel(
      title: "Secure and Private",
      headline: "Your privacy is our top priority. Securely sync your data across devices with end-to-end encryption. Your financial data stays private, always.",
      image: "secure-payment",
      gradientColors: [Color(.purple), Color(.pink)]
    ),
    OnboardingCardModel(
      title: "Get Insights and Save More",
      headline: "Receive tailored insights on how to reduce expenses and save money. With smart reminders and tips, you'll be on your way to achieving your financial goals faster.",
      image: "insight",
      gradientColors: [Color(.red), Color(.orange)]
    ),
    OnboardingCardModel(
      title: "Start Your Journey Today",
      headline: "Ready to take control of your finances? Let Quantix AI Expense Manager guide you every step of the way. Start tracking, start saving, and unlock your financial potential!",
      image: "start",
      gradientColors: [Color(.purple), Color(.pink)]
    ),

]
