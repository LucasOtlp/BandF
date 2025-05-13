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
    @IBOutlet weak var textLangue: UILabel!
    @IBOutlet weak var textMode: UILabel!
    @IBOutlet weak var monSwitch: UISwitch!
    @IBOutlet weak var header: UIView!
    @IBOutlet var background: UIView!
    @IBOutlet weak var langue: UISegmentedControl!
    var mode : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    @IBAction func TapSurModif(_ sender: UIButton) {
        print("start")
        AppDelegate.setLangue(langue.selectedSegmentIndex)
        print("\(langue.selectedSegmentIndex)")
        AppDelegate.setMode(mode)
        print("\(mode)")
        print("paramètre modifié")
        if AppDelegate.getMode() == 1 {
            header.backgroundColor = .systemBlue
            background.backgroundColor = .darkGray
            textMode.textColor = .white
            textLangue.textColor = .white
        }
        else {
            header.backgroundColor = UIColor(red: 132/255, green: 251/255, blue: 255/255, alpha: 255)
            background.backgroundColor = .white
            textMode.textColor = .darkText
            textLangue.textColor = .darkText
        }
        if AppDelegate.getLangue() == 0 {
            titre.text = "Paramètres"
            textMode.text = "Mode Sombre :"
            textLangue.text = "Langue :"
            boutonModif.titleLabel?.text = "Modifier les paramètres"
        }else{
            titre.text = "Parameters"
            textMode.text = "Dark Mode :"
            textLangue.text = "Language :"
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
