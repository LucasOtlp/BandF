//
//  AccueilViewController.swift
//  BandF
//
//  Created by etudiant on 10/03/2025.
//

import UIKit
import WebKit

class AccueilViewController: UIViewController {
    
    @IBOutlet weak var Video_pres: UIView! // UIView où afficher la vidéo
    var webView: WKWebView! // Déclaration de WebView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialiser WebView dans Video_pres
        webView = WKWebView(frame: Video_pres.bounds)
        Video_pres.addSubview(webView) // Ajouter WebView dans Video_pres
        
        // Charger la vidéo YouTube
        if let url = URL(string: "https://www.youtube.com/embed/dQw4w9WgXcQ") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
