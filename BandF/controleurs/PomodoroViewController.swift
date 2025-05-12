//
//  PomodoroViewController.swift
//  BandF
//
//  Created by etudiant on 22/04/2025.
//

import UIKit
import AVFoundation

class PomodoroViewController: UIViewController {
    
    @IBOutlet weak var boutonReset: UIButton!
    @IBOutlet weak var boutonPause: UIButton!
    @IBOutlet weak var boutonTaff: UIButton!
    @IBOutlet weak var essayer: UILabel!
    @IBOutlet weak var pomodoro: UILabel!
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var header: UIView!
    @IBOutlet var backgound: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var videoSlider: UISlider!
    
    var player: AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        showVideo()
        labTravail.text! = "25:00"
        labPause.text! = "5:00"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if AppDelegate.getMode() == 1 {
            header.backgroundColor = .systemBlue
            backgound.backgroundColor = .darkGray
            pomodoro.textColor = .white
            essayer.textColor = .white
            labPause.textColor = .white
            labTravail.textColor = .white
        }
        else {
            header.backgroundColor = UIColor(red: 132/255, green: 251/255, blue: 255/255, alpha: 255)
            backgound.backgroundColor = .white
            pomodoro.textColor = .darkText
            essayer.textColor = .darkText
            labPause.textColor = .darkText
            labTravail.textColor = .darkText
        }
        if AppDelegate.getLangue() == 0 {
            titre.text = "Pomodoro"
            pomodoro.text = "Le Pomodoro est une méthode qui consiste à faire des sessions de 25 minutes de travail pour 5 minutes de pause, autant de fois que possible afin de terminer ses tâches"
            essayer.text = "Vous pouvez l'essayer grâce aux minuteurs ci-dessous :"
            boutonTaff.titleLabel?.text = "Démarrer le Travail"
            boutonPause.titleLabel?.text = "Démarrer la Pause"
            boutonReset.titleLabel?.text = "Réinitialiser"
        }else{
            titre.text = "Pomodoro"
            pomodoro.text = "Pomodoro is a method that consists of making sessions of 25 minutes of work for 5 minutes of break, as many times as possible in order to complete your tasks"
            essayer.text = "You can try it by using the timers below :"
            boutonTaff.titleLabel?.text = "Start Work"
            boutonPause.titleLabel?.text = "Start Break"
            boutonReset.titleLabel?.text = "Reset"
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
        if let path = Bundle.main.path(forResource: "pomodoro", ofType: "mov") {
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
    
    var timer: Timer?
    var secondesRestantes = 0 // durée en secondes
    var minutesRestantes = 0
    
    @IBOutlet weak var labTravail: UILabel!
    @IBOutlet weak var labPause: UILabel!
    

    @IBAction func startTravailTimer(_ sender: Any) {
        
        labPause.text! = "5:00"
        
        timer?.invalidate()
        secondesRestantes = 60
        minutesRestantes = 24

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            self.secondesRestantes -= 1
            if self.secondesRestantes > 9 {
                self.labTravail.text = "\(minutesRestantes):\(secondesRestantes)"
            } else {
                self.labTravail.text = "\(minutesRestantes):0\(secondesRestantes)"
            }
            
            
            if (self.secondesRestantes <= 0 && self.minutesRestantes > 0) {
                self.minutesRestantes -= 1
                self.secondesRestantes = 60
            }

            if (self.secondesRestantes <= 0 && self.minutesRestantes <= 0) {
                self.timer?.invalidate()
                self.timer = nil
                self.labTravail.text = "Terminé !"
            }
        }
       
    }
    
    @IBAction func startPauseTimer(_ sender: Any) {
        
        labTravail.text! = "25:00"
        
        timer?.invalidate()
        secondesRestantes = 60
        minutesRestantes = 4

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            self.secondesRestantes -= 1
            if self.secondesRestantes > 9 {
                self.labPause.text = "\(minutesRestantes):\(secondesRestantes)"
            } else {
                self.labPause.text = "0\(minutesRestantes):0\(secondesRestantes)"
            }
            
            
            if (self.secondesRestantes <= 0 && self.minutesRestantes > 0) {
                self.minutesRestantes -= 1
                self.secondesRestantes = 60
            }

            if (self.secondesRestantes <= 0 && self.minutesRestantes <= 0) {
                self.timer?.invalidate()
                self.timer = nil
                self.labPause.text = "Terminé !"
            }
        }
        
    }
    
    @IBAction func tapSurReset(_ sender: Any) {
        
        self.timer?.invalidate()
        self.timer = nil
        labTravail.text! = "25:00"
        labPause.text! = "5:00"
        
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
