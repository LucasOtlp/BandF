//
//  ParametresViewController.swift
//  BandF
//
//  Created by etudiant on 24/04/2025.
//

import UIKit

class ParametresViewController: UIViewController {

    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var boutonModif: UIButton!
    @IBOutlet weak var textPolice: UILabel!
    @IBOutlet weak var textLangue: UILabel!
    @IBOutlet weak var textMode: UILabel!
    @IBOutlet weak var monSwitch: UISwitch!
    @IBOutlet weak var header: UIView!
    @IBOutlet var background: UIView!
    @IBOutlet weak var visuTaille: UILabel!
    @IBOutlet weak var taille: UIStepper!
    @IBOutlet weak var langue: UISegmentedControl!
    var mode : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        visuTaille.text = String(AppDelegate.getTailleText())
        taille.stepValue = 1
        taille.value = Double(AppDelegate.getTailleText())
        monSwitch.isOn = false
        if AppDelegate.getMode() == 1 {
            header.backgroundColor = .systemBlue
            background.backgroundColor = .darkGray
        }
        else {
            header.backgroundColor = UIColor(red: 132/255, green: 251/255, blue: 255/255, alpha: 255)
            background.backgroundColor = .white
        }
        // Do any additional setup after loading the view.
    }

    
    @IBAction func modifMode(_ sender: UISwitch) {
        if sender.isOn {
            mode = 1
        } else {
            mode = 0
        }
        print(mode)
    }
    
    @IBAction func tailleVar(_ sender: UIStepper) {
        visuTaille.text = String(Int(sender.value))
    }
    
    @IBAction func TapSurModif(_ sender: UIButton) {
        print("start")
        AppDelegate.setLangue(langue.selectedSegmentIndex)
        print("\(langue.selectedSegmentIndex)")
        AppDelegate.setMode(mode)
        print("\(mode)")
        AppDelegate.setTailleText(Int(taille.value))
        print("\(taille.value)")
        print("paramètre modifié")
        if AppDelegate.getMode() == 1 {
            header.backgroundColor = .systemBlue
            background.backgroundColor = .darkGray
            textMode.textColor = .white
            textLangue.textColor = .white
            textPolice.textColor = .white
            visuTaille.textColor = .white
        }
        else {
            header.backgroundColor = UIColor(red: 132/255, green: 251/255, blue: 255/255, alpha: 255)
            background.backgroundColor = .white
            textMode.textColor = .darkText
            textLangue.textColor = .darkText
            textPolice.textColor = .darkText
            visuTaille.textColor = .darkText
        }
        if AppDelegate.getLangue() == 0 {
            titre.text = "Paramètres"
            textMode.text = "Mode Sombre :"
            textLangue.text = "Langue :"
            textPolice.text = "Police :"
            boutonModif.titleLabel?.text = "Modifier les paramètres"
        }else{
            titre.text = "Parameters"
            textMode.text = "Dark Mode :"
            textLangue.text = "Language :"
            textPolice.text = "Font :"
            boutonModif.titleLabel?.text = "Modify parameters"
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
