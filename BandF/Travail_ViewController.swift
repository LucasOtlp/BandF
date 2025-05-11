//
//  Travail_ViewController.swift
//  BandF
//
//  Created by etudiant on 24/03/2025.
//

import UIKit
import AVFoundation

class Travail_ViewController: UIViewController {


    
    @IBOutlet weak var RestBouton: UIButton!
    @IBOutlet weak var palaisBouton: UIButton!
    @IBOutlet weak var pomodoroBouton: UIButton!
    @IBOutlet weak var textMethode: UILabel!
    @IBOutlet weak var textPodcast: UILabel!
    @IBOutlet weak var textIci: UILabel!
    @IBOutlet weak var textBienvenue: UILabel!
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var header: UIView!
    @IBOutlet var background: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var videoSlider: UISlider!
    
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
            textBienvenue.textColor = .white
            textIci.textColor = .white
            textPodcast.textColor = .white
            textMethode.textColor = .white
        }
        else {
            header.backgroundColor = UIColor(red: 132/255, green: 251/255, blue: 255/255, alpha: 255)
            background.backgroundColor = .white
            textBienvenue.textColor = .darkText
            textIci.textColor = .darkText
            textPodcast.textColor = .darkText
            textMethode.textColor = .darkText
        }
        if AppDelegate.getLangue() == 0 {
            titre.text = "Espace travail"
            textBienvenue.text = "Bienvenue dans l'espace travail !"
            textIci.text = "Ici, vous pouvez retrouver différentes méthodes de travail, toutes expliquées et détaillées afin que vous puissez les essayer."
            textPodcast.text = "N'hésitez pas à écouter le podcast ci-dessous pour plus d'informations :"
            textMethode.text = "Accédez aux différentes méthodes grâce aux boutons suivants :"
            pomodoroBouton.titleLabel?.text = "Pomodoro"
            palaisBouton.titleLabel?.text = "Palais Mental"
            RestBouton.titleLabel?.text = "Restitution Active"
        }else{
            titre.text = "Work space"
            textBienvenue.text = "Welcome to the work space!"
            textIci.text = "Here you can find different methods of work, all explained and detailed so that you can try them."
            textPodcast.text = "Don't hesitate to listen to the podcast below for more information :"
            textMethode.text = "Access to different methods through the buttons below :"
            pomodoroBouton.titleLabel?.text = "Pomodoro"
            palaisBouton.titleLabel?.text = "Mind Palace"
            RestBouton.titleLabel?.text = "Active Restoration"
            
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
    
    
    
    func showVideo() {
        if let path = Bundle.main.path(forResource: "IntroTravail", ofType: "mov") {
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
