//
//  PrivacyPolicyView.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var url: String
    @Binding var isFalse: Bool?
    @State var isVisible: Bool = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            WebContentView(url: URL(string:url)!) {
                content in
                if content.contains("\"error\" : true") {
                    isFalse = true
                }
                else {
                    self.isVisible = true
                }
            }
            .opacity(isVisible ? 1 : 0)
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
    PrivacyPolicyView(url: "https://catrabrendossto.site/",isFalse: .constant(true))
}
