//
//  String + Extension.swift
//  MarvelApp
//
//  Created by Guilherme Martins  on 30/10/20.
//

import Foundation

extension String {
    enum ValidType {
        case email
        case password
        case username
        case cpf
    }
    
    enum Regex: String {
        case emailtext = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case passwordtext = ".{6,}"
    }
    
    func isValid(validType: ValidType) -> Bool {
            let format = "SELF MATCHES %@"
            var regex = ""
            
        if validType == .email {
            regex = Regex.emailtext.rawValue
        }else if validType == .password{
            regex = Regex.passwordtext.rawValue
        }
        
        
            
            return NSPredicate(format:format, regex).evaluate(with: self)
        }
}
