//
//  ViewController.swift
//  Tamatem Task
//
//  Created by atsmac on 04/07/2023.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCenterButton()
    }
    
    private func setupCenterButton() {
        let openButton = UIButton(type: .system)
        openButton.setTitle("Open Browser", for: .normal)
        openButton.addTarget(self, action: #selector(openBrowser), for: .touchUpInside)
        openButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(openButton)
        
        setupCenterButtonConstraints(button: openButton)
    }
    
    private func setupCenterButtonConstraints(button: UIButton) {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func openBrowser() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "WebSiteViewController") as? WebSiteViewController {
            self.present(viewController, animated: true)
        }
    }
}

