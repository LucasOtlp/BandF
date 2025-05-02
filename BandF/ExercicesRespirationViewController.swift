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
    
    let duration: TimeInterval = 4.0
    var isInhaling = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CercleUIView.layer.cornerRadius = CercleUIView.frame.size.width / 2
        CercleUIView.backgroundColor = .systemBlue
        
        animationRespiration()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapSurCommencer(_ sender: Any) {
        
    }
    
    
    func animationRespiration() {
            UIView.animate(withDuration: duration, delay: 0, options: [.allowUserInteraction, .curveEaseInOut], animations: {
                if self.isInhaling {
                    self.CercleUIView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                    self.respirationLabel.text = "Inspire"
                } else {
                    self.CercleUIView.transform = CGAffineTransform.identity
                    self.respirationLabel.text = "Expire"
                }
            }) { _ in
                self.isInhaling.toggle()
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
