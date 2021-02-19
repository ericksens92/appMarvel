//
//  MarvelClass.swift
//  MarvelApp
//
//  Created by Erick Sens on 09/12/20.
//

import Foundation

struct MarvelInfo: Codable{
    let code: Int
    let status: String
    let data:MarvelData
}

struct MarvelData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results:[Herois]
}

struct Herois: Codable {
    var id : Int
    var name : String
    var description : String
    var thumbnail : Thumbnail
    var urls : [HeroUrl]
    

    struct Thumbnail: Codable {
        let path: String
        let ext: String
        var url: String {
            return path + "." + ext
        }
        
        enum CodingKeys: String, CodingKey{
            case path
            case ext = "extension"
        } }
    struct HeroUrl: Codable {
        let type: String
        let url: String
    }
    
    }
