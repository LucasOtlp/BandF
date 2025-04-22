//
//  PomodoroViewController.swift
//  BandF
//
//  Created by etudiant on 22/04/2025.
//

import UIKit

class PomodoroViewController: UIViewController {
    
    var timer: Timer?
    var secondesRestantes = 0 // durée en secondes
    var minutesRestantes = 0
    
    @IBOutlet weak var labTravail: UILabel!
    @IBOutlet weak var labPause: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labTravail.text! = "25:00"
        labPause.text! = "5:00"
        // Do any additional setup after loading the view.
    }

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
