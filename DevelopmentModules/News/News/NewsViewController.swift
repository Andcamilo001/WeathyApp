//
//  NewsViewController.swift
//  News
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import UIKit
import WebKit

public class NewsViewController: UIViewController {

    var webView: WKWebView!
    var closeButton: UIButton!

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "Noticias"
        
        webView = WKWebView(frame: self.view.bounds)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(webView)
        
        if let url = URL(string: "https://www.accuweather.com/es/world-weather") {
            let request = URLRequest(url: url)
            webView.load(request)
        }

        let newsButton = UIBarButtonItem(
            image: UIImage(systemName: "newspaper"),
            style: .plain,
            target: self,
            action: #selector(openWebView)
        )
        navigationItem.rightBarButtonItem = newsButton
        
        closeButton = UIButton(frame: CGRect(x: self.view.frame.width - 50, y: 40, width: 40, height: 40))
        closeButton.setTitle("X", for: .normal)
        closeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        closeButton.setTitleColor(.red, for: .normal)
        closeButton.addTarget(self, action: #selector(closeWebView), for: .touchUpInside)
        closeButton.isHidden = true
        self.view.addSubview(closeButton)
    }
    
    @objc func openWebView() {
        webView.isHidden = false
        closeButton.isHidden = false
    }
    
    @objc func closeWebView() {
        webView.isHidden = true
        closeButton.isHidden = true
    }
}
