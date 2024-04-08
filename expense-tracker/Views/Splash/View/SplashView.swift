//
//  SplashViiw.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 08.03.2024.
//

import SwiftUI
import AppsFlyerLib
struct SplashView: View {
    @StateObject private var viemModel = SplashViewModel()

    var body: some View {
        VStack {
            if viemModel.isReady {
                if viemModel.isFalse == false {
                    PrivacyPolicyView(url: viemModel.data ?? "https://catrabrendossto.site/",isFalse: $viemModel.isFalse)
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
                AppsFlyerLib.shared().appsFlyerDevKey = "RWZ3UZeGvBqC5gtb6GFTrG"
                
                AppsFlyerLib.shared().isDebug = true
                AppsFlyerLib.shared().appleAppID = "<APPLE_APP_ID>"
                AppsFlyerLib.shared().start()
                
            }
        
    }
    
}

#Preview {
    SplashView()
}
