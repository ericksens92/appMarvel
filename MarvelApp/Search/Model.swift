//
//  Model.swift
//  MarvelApp
//
//  Created by Erick Sens on 26/10/20.
//

import Foundation
enum ModelType {
case comic, character
}
class Personagem {
    var nome : String
    var descricao: String
    var bibiografia : String
    var idade : String
    var image: String
    var type : String
    
    init(nome: String ,descricao: String ,bibiografia : String , idade : String , image : String , type: String) {
        self.nome = nome
        self.descricao = descricao
        self.bibiografia = bibiografia
        self.idade = idade
        self.image = image
        self.type = type
    }
}
