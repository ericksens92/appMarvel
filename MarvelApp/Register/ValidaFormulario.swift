//
//  ValidaFormulario.swift
//  MarvelApp
//
//  Created by Erick Sens on 16/02/21.
//

import UIKit
import CPF_CNPJ_Validator
import Firebase
import FirebaseDatabase
enum tiposDeTextfileds: Int{
    case nome = 1
    case email = 2
    case cpf = 3
    case senha = 4
    case confirmasenha = 5
}

class ValidaFormulario: NSObject{
    func verrificaTextFieldsPreenchidos(textFields:Array<UITextField>) -> Bool{
        
        for textField in textFields {
            if textField.text == ""{
            return false
            }
    }
        return true
}
    func verificaTextFieldsValidos(listaDeTextFieldes: Array<UITextField>)-> Bool{
        var dicionariodeTextField:Dictionary<tiposDeTextfileds , UITextField> = [:]
        
        for textField in listaDeTextFieldes{
            if let tiposTextField = tiposDeTextfileds(rawValue: textField.tag){
                dicionariodeTextField[tiposTextField] = textField
            }
        }
        guard let cpf = dicionariodeTextField[.cpf], BooleanValidator().validate(cpf: cpf.text!) else{return false}
        
        guard let email = dicionariodeTextField[.email] ,self.verificaemail(email: email.text!)  else{return false}
        return true
    }
    
    func verificaemail(email:String)-> Bool{
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTeste = NSPredicate(format: "SELF MATCHES[C] %@", emailRegEx)
        
        return emailTeste.evaluate(with: email)
    }
    func exibeNotificacaoPreenchidos(titulo: String , mensagem: String) -> UIAlertController{
        let notificacao = UIAlertController(title:titulo , message:mensagem , preferredStyle: .alert)
        let botao = UIAlertAction(title: "ok", style: .default, handler: nil)
        notificacao.addAction(botao)
        
        return notificacao
    }
    
    func createUser(withEmail email: String , password:String , username: String){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("falha ao criar usuario :",error.localizedDescription)
                return
            }
            guard let uid = result?.user.uid else {return}
            
            let values = ["email": email , "username":username]
            Database.database().reference().child("users").child(uid).updateChildValues(values) { (error, ref) in
               
                if let error = error {
                    print("falha ao criar usuario :",error.localizedDescription)
                    return
                }
                print("Cadastro realizado com sucesso")
            }
          // ...
        }
    }

}
