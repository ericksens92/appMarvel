//
//  MarvelAPI.swift
//  MarvelApp
//
//  Created by Erick Sens on 09/12/20.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI{
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let privateKey = "c7405c78020b750cefe4c40d9d0ef20a69294cc8"
    static private let publicKey = "f2f093abbfb68ba2ad9177d704a9f905"
    static private let limit = 50

    class func loadHeros(name: String?, page:Int = 0 ,onComplete: @escaping (MarvelInfo?) -> Void) {
        let offset = page * limit
        let startswith: String
        if let name = name , !name.isEmpty{
            startswith = "nameStartsWith =\(name.replacingOccurrences(of: " ", with: ""))&"
        }else{
            startswith = ""
        }
        let url = basePath + "&offset=\(offset)&limit=\(limit)&" + startswith + getCredentials()
        debugPrint(url)
        AF.request(url).responseJSON { (response) in
            guard let data = response.data,
                  let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data) else {
                
                onComplete(nil)
                return
            }
            onComplete(marvelInfo)
        }
        
    }

private class func getCredentials() -> String{
    let ts = String(Date().timeIntervalSince1970)
    let hash  = MD5(ts+privateKey+publicKey).lowercased()

    return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
  
}

}
