//
//  Taches_ViewController.swift
//  BandF
//
//  Created by etudiant on 12/05/2025.
//

import UIKit

class Taches_ViewController: UIViewController {

    var LesTaches : [tache] = AppDelegate.getToutesLesTaches()
    
    
    @IBOutlet weak var nomTacheTF: UITextField!
    @IBOutlet weak var descriptionTacheTF: UITextField!
    @IBOutlet weak var dateDP: UIDatePicker!
    @IBOutlet weak var confirmLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confirmLabel.text! = ""
        // Do any additional setup after loading the view.
    }
    

    @IBAction func tapSurAjouterTache(_ sender: Any) {
        if nomTacheTF.text!.isEmpty || descriptionTacheTF.text!.isEmpty {
            confirmLabel.text! = "champs incomplets"
        }else{
            let nom : String = nomTacheTF.text!
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            let date : String = formatter.string(from: dateDP.date)
            let description : String = descriptionTacheTF.text!
            AppDelegate.ajouterTache(tache(nom, date, description))
            confirmLabel.text! = "Enregistrement effectué"
        }
    }
    
    
    @IBAction func tapSurSauvegarder(_ sender: Any) {
        LesTaches.ecritureJSON(AppDelegate.getToutesLesTaches())
    }
    
    
    @IBAction func tapSurEffacer(_ sender: Any) {
        nomTacheTF.text = ""
        dateDP.date = Date()
        descriptionTacheTF.text = ""
        confirmLabel.text! = ""
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
