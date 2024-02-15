//
//  SettingsView.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//


import SwiftUI

enum ActiveSheet: Identifiable {
    case first, second
    
    var id: Int {
        hashValue
    }
}


struct SettingsView: View {
    @State private var isPresentViewPrivacyPolicy = false
    @State private var isPresentViewTerms = false

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    List {
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .frame(width:100, height: 100, alignment: .center)
                            }
                            Spacer()
                        }
                        Text("Unlock the full potential of your finances with Quantix AI Expense Manager! Our intuitive app simplifies tracking your expenses and income, helping you gain control over your budget with ease.").font(.system(size: 16))
                        
                        Section(header: Text("Information")) {
                            Text("Privacy Policy").onTapGesture {
                                isPresentViewPrivacyPolicy = true
                            }
                            Text("Terms of use").onTapGesture {
                                isPresentViewTerms = true
                            }
                        }
                        
                    }
                }
                    Spacer()
                    Text("Version: 1.0.0")
            }
            .foregroundColor(.black)
            .navigationTitle("About")
            .sheet(isPresented: $isPresentViewPrivacyPolicy) {
                NavigationStack {
                    PrivacyPolicyView()
                }
            }
            .sheet(isPresented: $isPresentViewTerms) {
                NavigationStack {
                    TermsView()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
