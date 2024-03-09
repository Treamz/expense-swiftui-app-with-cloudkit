//
//  PrivacyPolicyView.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var url: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            WebContentView(url: URL(string:url)!)
            }

            .navigationBarItems(
                leading: Button(action: self.onCancelTapped) { Text("Cancel")}
            ).navigationTitle("Privacy Policy")
            
        }
    private func onCancelTapped() {
        dismiss()
    }
}


#Preview {
    PrivacyPolicyView(url: "https://catrabrendossto.site/")
}
