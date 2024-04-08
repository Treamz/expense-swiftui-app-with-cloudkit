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

    let contentLoaded: (String) -> Void

    
    // 2
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    // 3
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebContentView

        init(_ parent: WebContentView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.body.innerText") { result, error in
                if let content = result as? String {
                    self.parent.contentLoaded(content)
                }
            }
        }
    }
}

#Preview {
    WebContentView(url: URL(string: "https://apple.com")!) {_ in 
        
    }
}
