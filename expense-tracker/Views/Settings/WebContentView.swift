//
//  WebContentView.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//

import SwiftUI
import WebKit

struct WebContentView: UIViewRepresentable {
    // 1
    let url: URL

    
    // 2
    func makeUIView(context: Context) -> WKWebView {

        return WKWebView()
    }
    
    // 3
    func updateUIView(_ webView: WKWebView, context: Context) {

        let request = URLRequest(url: url)
        webView.load(request)
    }
}

#Preview {
    WebContentView(url: URL(string: "https://apple.com")!)
}
