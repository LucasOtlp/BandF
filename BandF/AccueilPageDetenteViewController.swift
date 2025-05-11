//
//  AccueilPageDetenteViewController.swift
//  BandF
//
//  Created by etudiant on 24/03/2025.
//

import UIKit
import AVFoundation

class AccueilPageDetenteViewController: UIViewController {

    
    @IBOutlet weak var exoBouton: UIButton!
    @IBOutlet weak var musiqueBouton: UIButton!
    @IBOutlet weak var textEntrer: UILabel!
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var header: UIView!
    @IBOutlet var background: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var videoSlider: UISlider!
    
    @IBOutlet weak var theoImageView: UIImageView!
    
    var player: AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        showVideo()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if AppDelegate.getMode() == 1 {
            header.backgroundColor = .systemBlue
            background.backgroundColor = .darkGray
            textEntrer.textColor = .white
        }
        else {
            header.backgroundColor = UIColor(red: 132/255, green: 251/255, blue: 255/255, alpha: 255)
            background.backgroundColor = .white
            textEntrer.textColor = .darkText
        }
        if AppDelegate.getLangue() == 0 {
            titre.text = "Espace détente"
            textEntrer.text = "Vous entrez dans l'espace de détente. Ici, vous trouverez du contenu destiné à vous déstresser. Mais avant d'aller plus loin, si c'est la première fois que vous venez, prenez le temps d'écouter ce cours podcast/vidéo pour en savoir plus sur ce qui vous attend."
            musiqueBouton.titleLabel?.text = "Accéder à des musiques pour se détendre"
            exoBouton.titleLabel?.text = "Accéder aux exercices de relaxation"
        }else{
            titre.text = "Relaxation Space"
            textEntrer.text = "You enter the relaxation space. Here you will find content designed to relax you. But before going further, if this is your first time, take the time to listen to this podcast/video to find out more about what awaits you."
            musiqueBouton.titleLabel?.text = "Access to relaxing music"
            exoBouton.titleLabel?.text = "Access to relaxation exercises"
        }
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
        if let path = Bundle.main.path(forResource: "Detente", ofType: "mov") {
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
