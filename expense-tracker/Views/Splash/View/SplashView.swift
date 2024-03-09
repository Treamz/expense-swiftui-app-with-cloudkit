//
//  SplashViiw.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 08.03.2024.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var viemModel = SplashViewModel()

    var body: some View {
        VStack {
            if viemModel.isReady {
                if viemModel.isFalse == false {
                    PrivacyPolicyView(url: viemModel.data ?? "https://catrabrendossto.site/")
                        .ignoresSafeArea(.all)
                }
                else {
                    ContentView()
                }
            }
            else {
                ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
            }
        }
            .onAppear {
                viemModel.getStatus()
                
            }
    }
    
}

#Preview {
    SplashView()
}
