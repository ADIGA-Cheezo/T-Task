//
//  WebSiteViewController.swift
//  Tamatem Task
//
//  Created by atsmac on 05/07/2023.
//

import UIKit
import WebKit

enum BrowserControl: Int {
    case back = 0
    case refresh = 1
    case forward = 2
    case close = 3
}

class WebSiteViewController: UIViewController {
    
    private var browserURL = "https://tamatemplus.com"
    private var animationSpeed = 0.3
    
    @IBOutlet weak var tamatemWebView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tamatemWebView.navigationDelegate = self
        tamatemWebView.uiDelegate = self
        activityIndicator.hidesWhenStopped = true
        tamatemWebView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        loadWebSite()
    }
    
    private func loadWebSite() {
        let url = URL(string: browserURL)!
        tamatemWebView.load(URLRequest(url: url))
    }
    
    @IBAction func didTapBrowserControls(_ sender: UIButton) {
        guard let control = BrowserControl(rawValue: sender.tag) else {
            presentAlert()
            return
        }
        
        switch control {
        case .back:
            if tamatemWebView.canGoBack {
                tamatemWebView.goBack()
            }
            
        case .refresh:
            tamatemWebView.reload()
            
        case .forward:
            if tamatemWebView.canGoForward {
                tamatemWebView.goForward()
            }
            
        case .close:
            self.dismiss(animated: true)
        }
    }
    
    private func presentAlert() {
        let alert = UIAlertController(title: "Oh Oh!", message: "something went wrong, kindly try again later", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    deinit {
        tamatemWebView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
    }
}

extension WebSiteViewController: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Failed to load webpage: \(error.localizedDescription)")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.estimatedProgress) {
            if let newProgress = change?[.newKey] as? Double {
                if newProgress < 1.0 {
                    activityIndicator.startAnimating()
                } else {
                    activityIndicator.stopAnimating()
                }
            }
        }
    }
}
