//
//  AccueilViewController.swift
//  BandF
//
//  Created by etudiant on 10/03/2025.
//

import UIKit
import AVKit
import AVFoundation

class AccueilViewController: UIViewController {

    @IBOutlet weak var Video_pres: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideo()

        // Do any additional setup after loading the view.
    }
    
    func playVideo() {
        guard let path = Bundle.main.path(forResource: "198790-9088575412", ofType: "mov") else {
            print("Vidéo non trouvée")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        let player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = Video_pres.bounds
        playerLayer.videoGravity = .resizeAspectFill
        
        Video_pres.layer.addSublayer(playerLayer)
        
        player.play()
    }
    
}
