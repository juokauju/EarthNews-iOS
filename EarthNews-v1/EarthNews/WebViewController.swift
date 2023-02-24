//
//  WebViewController.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    private var webView: WKWebView!
    private var progressView: UIProgressView!
    
    let url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUrl()
        setChevronBackNavigationButton()
    }
}

extension WebViewController {
    private func loadUrl() {
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = "The Guardian"
    }
}
