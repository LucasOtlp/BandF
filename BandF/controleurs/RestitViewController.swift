//
//  RestitViewController.swift
//  BandF
//
//  Created by etudiant on 07/05/2025.
//

import UIKit
import AVFoundation

class RestitViewController: UIViewController {

    @IBOutlet weak var textRepetez: UILabel!
    @IBOutlet weak var textCorriger: UILabel!
    @IBOutlet weak var textTechinique: UILabel!
    @IBOutlet weak var titile: UILabel!
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
            textRepetez.textColor = .white
            textCorriger.textColor = .white
            textTechinique.textColor = .white
        }
        else {
            header.backgroundColor = UIColor(red: 132/255, green: 251/255, blue: 255/255, alpha: 255)
            background.backgroundColor = .white
            textRepetez.textColor = .darkText
            textCorriger.textColor = .darkText
            textTechinique.textColor = .darkText
        }
        if AppDelegate.getLangue() == 0 {
            titile.text = "Restitution Active"
            textTechinique.text = "La technique de Restitution Active est très simple à mettre en place : Il vous suffit simplement de prendre une feuille vierge, et de restituer à l'écrit tout ce que vous savez de votre cours/texte à apprendre."
            textCorriger.text = "Une fois ceci fait, reprenez ce que vous avez à apprendre : vous devez vous corriger et rajouter les informations que vous avez oubliées."
            textRepetez.text = "Répétez ce processus autant de fois que nécéssaire, jusqu'à connaître par coeur !"
        }else{
            titile.text = "Active Restoration"
            textTechinique.text = "The active restoration technique is very simple to set up: all you have to do is take a blank sheet of paper and restore everything you know from your course/text to learn."
            textCorriger.text = "Once this is done, take what you still need to learn: you must correct yourself and add the information you have forgotten."
            textRepetez.text = "Repeat this process as often as necessary, until you know by heart!"
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
        if let path = Bundle.main.path(forResource: "RestitutionActive", ofType: "mov") {
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
