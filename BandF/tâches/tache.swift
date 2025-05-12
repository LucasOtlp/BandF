//
//  tache.swift
//  BandF
//
//  Created by etudiant on 12/05/2025.
//

class tache : Codable {
    
    private var Titre: String
    private var Date: String
    private var Description: String
    
    public init(_ Titre: String, _ Date: String, _ Description: String) {
        self.Titre = Titre
        self.Date = Date
        self.Description = Description
    }
    
    public func getTitre() -> String {
        return Titre
    }
    
    public func getDate() -> String {
        return Date
    }
    
    public func getDescription() -> String {
        return Description
    }
    
}
