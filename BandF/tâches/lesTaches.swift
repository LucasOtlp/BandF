//
//  lesTaches.swift
//  BandF
//
//  Created by etudiant on 12/05/2025.
//

import Foundation

class LesTaches {
    
    private static var lesTaches: [tache] = []
    
    private static func getTousLesElements() -> [tache] {
        return lesTaches
    }
    
    public static func ecritureJSON(_ toutesLesTaches : [tache]){
        let leFileManager = FileManager.default
        let tabUrsDocument = leFileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let urlRespDocument = tabUrsDocument.first!
        let urlFic = urlRespDocument.appendingPathComponent("taches.json")
        
        let objJSONEncodeur = JSONEncoder()
        let donneeAsauvegarderEnJSON = try? objJSONEncodeur.encode(toutesLesTaches)
        
        leFileManager.createFile(atPath: urlFic.path, contents: donneeAsauvegarderEnJSON, attributes: nil)
        exit(0)
    }
    
    public static func chargementJSON()-> [tache] {
        var toutesLesTaches: [tache] = []
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("taches.json")
        
        if FileManager.default.fileExists(atPath: url.path){
            toutesLesTaches = loadJSON(uneURL: url)!
        }else{
            print("Le fichier n'existe pas")
        }
        return toutesLesTaches
    }
    
    private static func loadJSON (uneURL : URL) ->[tache]?{
        do {
            let data = try Data(contentsOf: uneURL)
            let decoder = JSONDecoder()
            let lesTachesDecodes = try decoder.decode([tache].self, from: data)
            return lesTachesDecodes
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    
    
}
