//
//  PrivacyPolicyView.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            WebContentView(url: URL(string: "https://doc-hosting.flycricket.io/quantix-expense-management-privacy-policy/1c1ed0c7-222f-48fd-bcd8-38823d5341d8/privacy")!)
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
    PrivacyPolicyView()
}
