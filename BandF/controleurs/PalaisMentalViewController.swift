//
//  PalaisMentalViewController.swift
//  BandF
//
//  Created by etudiant on 11/05/2025.
//

import UIKit

class PalaisMentalViewController: UIViewController {

    @IBOutlet weak var accesBouton: UIButton!
    @IBOutlet weak var textExemple: UILabel!
    @IBOutlet weak var textpermet: UILabel!
    @IBOutlet weak var textConsiste: UILabel!
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var header: UIView!
    @IBOutlet var background: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if AppDelegate.getMode() == 1 {
            header.backgroundColor = .systemBlue
            background.backgroundColor = .darkGray
            textConsiste.textColor = .white
            textpermet.textColor = .white
            textExemple.textColor = .white
        }
        else {
            header.backgroundColor = UIColor(red: 132/255, green: 251/255, blue: 255/255, alpha: 255)
            background.backgroundColor = .white
            textConsiste.textColor = .darkText
            textpermet.textColor = .darkText
            textExemple.textColor = .darkText
        }
        if AppDelegate.getLangue() == 0 {
            titre.text = "Palais Mental"
            textConsiste.text = "Le Palais Mental est peu reconnu, malgré sa grande efficacité. Il consiste à diviser ce que vous avez à apprendre en plusieurs parties, autant que de pièce chez vous par exemple. Vous allez ensuite vous déplacer de pièce en pièce pour apprendre les différentes parties."
            textpermet.text = "Cela permet ainsi de faire fonctionner sa mémoire en associant un endroit à ce que l'on apprend."
            textExemple.text = "Voici un exemple simple d'application du Palais Mental pour apprendre un oral :"
            accesBouton.titleLabel?.text = "Acceder au podcast"
        }else{
            titre.text = "Mental Palace"
            textConsiste.text = "The Mental Palace is not very well known, despite its great effectiveness. It consists to divide what you have to learn in several parts, as many rooms as you have in your house, for example. Then you will move from room to room to learn the different parts."
            textpermet.text = "This allows, therefore, to make work its memory by associating a place to what you learn."
            textExemple.text = "Here is a simple example of application of the Mental Palace to learn an oral:"
            accesBouton.titleLabel?.text = "Access the podcast"
            
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
