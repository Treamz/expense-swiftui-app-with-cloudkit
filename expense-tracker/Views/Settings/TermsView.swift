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
            WebContentView(url: URL(string: "https://catrabrendossto.site/terms")!) {
                content in
                
            }
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
