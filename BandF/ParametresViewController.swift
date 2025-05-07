//
//  ParametresViewController.swift
//  BandF
//
//  Created by etudiant on 24/04/2025.
//

import UIKit

class ParametresViewController: UIViewController {

    @IBOutlet weak var visuTaille: UILabel!
    @IBOutlet weak var taille: UIStepper!
    @IBOutlet weak var langue: UISegmentedControl!
    @IBOutlet weak var mode: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visuTaille.text = String(AppDelegate.getTailleText())
        taille.stepValue = 1
        taille.value = Double(AppDelegate.getTailleText())
        // Do any additional setup after loading the view.
    }

    
    @IBAction func tailleVar(_ sender: UIStepper) {
        visuTaille.text = String(Int(sender.value))
    }
    @IBAction func tapSurModif(_ sender: Any) {
        AppDelegate.setLangue(langue.selectedSegmentIndex)
        AppDelegate.setMode(mode.hashValue)
        AppDelegate.setTailleText(Int(taille.value))
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
