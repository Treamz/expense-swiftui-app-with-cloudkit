//
//  TermsView.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 15.02.2024.
//

import SwiftUI

struct TermsView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            WebContentView(url: URL(string: "https://doc-hosting.flycricket.io/quantix-expense-management-terms/850c1b9b-8122-4d2a-801c-7b3e7382c52c/terms")!)
            }

            .navigationBarItems(
                leading: Button(action: self.onCancelTapped) { Text("Cancel")}
            ).navigationTitle("Terms of use")
            
        }
    private func onCancelTapped() {
        dismiss()
    }
}

#Preview {
    TermsView()
}
