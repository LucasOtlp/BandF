//
//  Taches_ViewController.swift
//  BandF
//
//  Created by etudiant on 12/05/2025.
//

import UIKit

class Taches_ViewController: UIViewController {

    var toutesLesTaches : [tache] = AppDelegate.getToutesLesTaches()
    
    @IBOutlet weak var accesBouton: UIButton!
    @IBOutlet weak var delateBouton: UIButton!
    @IBOutlet weak var saveBouton: UIButton!
    @IBOutlet weak var ajoutBouton: UIButton!
    @IBOutlet var background: UIView!
    @IBOutlet weak var textDate: UILabel!
    @IBOutlet weak var textDesc: UILabel!
    @IBOutlet weak var textNom: UILabel!
    @IBOutlet weak var nomTacheTF: UITextField!
    @IBOutlet weak var descriptionTacheTF: UITextField!
    @IBOutlet weak var dateDP: UIDatePicker!
    @IBOutlet weak var confirmLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confirmLabel.text! = ""
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if AppDelegate.getMode() == 1 {
            background.backgroundColor = .darkGray
            textNom.textColor = .white
            textDesc.textColor = .white
            textDate.textColor = .white
            confirmLabel.textColor = .white
            
        }
        else {
            background.backgroundColor = .white
            textNom.textColor = .darkText
            textDesc.textColor = .darkText
            textDate.textColor = .darkText
            confirmLabel.textColor = .darkText
        }
        if AppDelegate.getLangue() == 0 {
            textNom.text = "Nom :"
            textDesc.text = "Description :"
            textDate.text = "Date :"
            ajoutBouton.titleLabel?.text = "ajouter la tâche"
            saveBouton.titleLabel?.text = "sauvegarder et quitter"
            delateBouton.titleLabel?.text = "effacer"
            accesBouton.titleLabel?.text = "acceder aux tâches"
        }else{
            textNom.text = "Name :"
            textDesc.text = "Description :"
            textDate.text = "Date :"
            ajoutBouton.titleLabel?.text = "add task"
            saveBouton.titleLabel?.text = "save and exit"
            delateBouton.titleLabel?.text = "delete"
            accesBouton.titleLabel?.text = "access tasks"
        }
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
