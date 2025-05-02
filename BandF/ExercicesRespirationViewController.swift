//
//  ExercicesRespirationViewController.swift
//  BandF
//
//  Created by etudiant on 08/04/2025.
//

import UIKit

class ExercicesRespirationViewController: UIViewController {

    
    @IBOutlet weak var CercleUIView: UIView!
    @IBOutlet weak var respirationLabel: UILabel!
    @IBOutlet weak var reglerDureeInspi: UIStepper!
    @IBOutlet weak var reglerDureeExpi: UIStepper!
    
    @IBOutlet weak var dureeInspiLabel: UILabel!
    @IBOutlet weak var DureeExpiLabel: UILabel!
    
    @IBOutlet weak var BoutonButton: UIButton!
    
    let duration: TimeInterval = 4.0
    var inspire = true
    var tempInspi : Int = 1
    var tempExpi : Int = 1
    var respirationEnCours : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        CercleUIView.layer.cornerRadius = CercleUIView.frame.size.width / 2
        CercleUIView.backgroundColor = .systemBlue
        
        reglerDureeExpi.minimumValue = 1
        reglerDureeExpi.maximumValue = 10
        reglerDureeInspi.minimumValue = 1
        reglerDureeInspi.maximumValue = 10
        BoutonButton.setTitle("Commencer", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapSurCommencer(_ sender: Any) {
        if BoutonButton.title(for: .normal) == "Commencer" {
            BoutonButton.setTitle("Arrêter", for: .normal)
            respirationEnCours = true
            animationRespiration()
        }else {
            BoutonButton.setTitle("Commencer", for: .normal)
            respirationEnCours = false
            respirationLabel.text = "Prêt ?"
        }
    }
    
    
    @IBAction func tapSurReglerInspiStepper(_ sender: Any) {
        dureeInspiLabel.text = String(reglerDureeInspi.value)
        tempInspi = Int(reglerDureeInspi.value)
    }
    
    
    @IBAction func tepSurReglerExpiStepper(_ sender: Any) {
        DureeExpiLabel.text = String(reglerDureeExpi.value)
        tempExpi = Int(reglerDureeExpi.value)
    }
    
    
    func animationRespiration() {
        guard respirationEnCours else { return }
        
        UIView.animate(withDuration: duration, delay: 0, options: [.allowUserInteraction, .curveEaseInOut], animations: {
            if self.inspire {
                self.CercleUIView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                self.respirationLabel.text = "Inspire"
            } else {
                self.CercleUIView.transform = CGAffineTransform.identity
                self.respirationLabel.text = "Expire"
            }
        }) { _ in
            self.inspire.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.animationRespiration()
            }
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
