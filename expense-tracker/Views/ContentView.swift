//
//  ContentView.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//

import SwiftUI
import AppsFlyerLib
struct ContentView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    var body: some View {
        if(isOnboarding) {
            OnBoardingView()
        }
        else {
            TabView {
                DashboardTabView()
                    .tabItem {
                        VStack {
                            Text("Dashboard")
                            Image(systemName: "chart.pie")
                        }
                }
                .tag(0)
                
                LogsTabView()
                    .tabItem {
                        VStack {
                            Text("Logs")
                            Image(systemName: "tray")
                        }
                }
                .tag(1)
                NotesView()
                    .tabItem {
                        VStack {
                            Text("Notes")
                            Image(systemName: "note")
                        }
                }
                .tag(2)
                SettingsView()
                    .tabItem {
                        VStack {
                            Text("Settings")
                            Image(systemName: "gear")
                        }
                }
                .tag(3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, CoreDataStack(containerName: "ExpenseTracker").viewContext)
    }
}
