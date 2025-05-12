//
//  PodcastsDetenteViewController.swift
//  BandF
//
//  Created by etudiant on 08/04/2025.
//
import WebKit
import UIKit

class PodcastsDetenteViewController: UIViewController {
    
    var youtubeWK: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        youtubeWK = WKWebView(frame: view.bounds)
        youtubeWK.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                view.addSubview(youtubeWK)
        
        if let url = URL(string: "https://www.youtube.com/playlist?list=PL6NdkXsPL07Lsw96-sKeCMezkn0LuZ8mi") {
            let request = URLRequest(url: url)
            youtubeWK.load(request)
        }

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
