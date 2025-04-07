//
//  AccueilPageDetenteViewController.swift
//  BandF
//
//  Created by etudiant on 24/03/2025.
//

import UIKit
import AVFoundation

class AccueilViewController: UIViewController {

    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var videoSlider: UISlider!
    
    @IBOutlet weak var theoImageView: UIImageView!
    
    var player: AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        showVideo()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ChangementSurSlider(_ sender: UISlider) {
        let seconds = Double(sender.value)
        let targetTime = CMTime(seconds: seconds, preferredTimescale: 600)
        player?.seek(to: targetTime)
    }
    
    
    @IBAction func tapSurPlay(_ sender: Any) {
        player?.play()
    }
    
    
    @IBAction func tapSurPause(_ sender: Any) {
        player?.pause()
    }
    
    
    @IBAction func tapSurRevoir(_ sender: Any) {
        player?.seek(to: .zero)
        player?.play()
    }
    
    
    func addPeriodicTimeObserver() {
        guard let player = player else { return }
        // ✅ Attendre que l’item soit prêt avant de lire la durée
        if let duration = player.currentItem?.asset.duration {
            let seconds = CMTimeGetSeconds(duration)
            videoSlider.maximumValue = Float(seconds)
            videoSlider.minimumValue = 0
        }

        let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] time in
            let currentSeconds = CMTimeGetSeconds(time)
            self?.videoSlider.value = Float(currentSeconds)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Animation de disparition de l'image
        UIView.animate(withDuration: 2.0, animations: {
            self.theoImageView.alpha = 0.0  // Rendre l'image complètement transparente
        })
    }
    
    func showVideo() {
        if let path = Bundle.main.path(forResource: "fortbattlepass", ofType: "mp4") {
            let url = URL(fileURLWithPath: path)
            player = AVPlayer(url: url)
            
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = videoView.bounds
            playerLayer.videoGravity = .resizeAspectFill
            videoView.layer.addSublayer(playerLayer)
            
            // ✅ Ajouter l’observateur ici, une fois le player créé
            addPeriodicTimeObserver()
        }
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
