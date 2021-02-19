//
//  Herois.swift
//  MarvelApp
//
//  Created by Erick Sens on 25/10/20.
//

import Foundation

struct Herois {
    var id : Int
    var description: String
    var thumbnail : Thumbmail
    var url : [HeroUrl]
    var name : String

    struct Thumbmail {
        let path: String
        let ext: String
        var url: String {
            return path + "." + ext
        }
        
        enum CodinKeys: String, CodingKey{
            case path
            case ext = "extension"
        } }
    struct HeroUrl: Codable {
        let type: String
        let url: String
    }
    
    }


