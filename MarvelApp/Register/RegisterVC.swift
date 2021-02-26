//
//  RegisterVC.swift
//  MarvelApp
//
//  Created by Caio on 21/09/20.
//

import UIKit
import CPF_CNPJ_Validator
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore

class RegisterVC: BaseViewController {

   
    
    var activeField: UITextField?
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configScreen()
        
       
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
    }
    
    func configScreen(){
       
        self.signUpButton.layer.cornerRadius = 24
        self.signUpButton.layer.borderWidth = 3
        self.signUpButton.layer.borderColor = UIColor.white.cgColor

       
       
       
       
        
        
 //       if !self.isValidField(textField: self.emailTextField, type: .email){
 //          print("Erro")
   //     }else{
     //       print("Sucesso")
     //   }
     //   if !self.isValidField(textField: self.passwordTextField, type: .password){
       //     print("Erro")
       // }else{
         //   print("Sucesso")
       // }
}
    
    @IBAction func TappedSignUp(_ sender: UIButton) {
        let  textFieldsEstaoPreehcidos = ValidaFormulario().verrificaTextFieldsPreenchidos(textFields: textFields)
        
        let textFieldsEstaoValidos = ValidaFormulario().verificaTextFieldsValidos(listaDeTextFieldes: textFields)
        
        if textFieldsEstaoPreehcidos && textFieldsEstaoValidos{
            let alerta = ValidaFormulario().exibeNotificacaoPreenchidos(titulo: "Parabens", mensagem: "Cadastro realizado com sucesso")
            
            
            present(alerta, animated: true, completion: nil)
           
            
        }
        else {
            let alerta = ValidaFormulario().exibeNotificacaoPreenchidos(titulo: "Atenção", mensagem: "Preencha todos os campos Corretamente")
            
            present(alerta, animated: true, completion: nil)
        }
        
        guard let email = emailTextField.text else {return}
        guard let senha = senhaTextField.text else {return}
        guard let username = UsernameTextField.text else {return}
        
        ValidaFormulario().createUser(withEmail: email, password: senha, username: username)
        
        self.performSegue(withIdentifier: "homeTabBar", sender: nil)
    }
    
   
    @IBAction func tappedLogin(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
 
//    func textFieldDidBeginEditing(textField: UITextField) {
//            self.animateViewMoving(up: true, moveValue: 100)
//    }
//    func textFieldDidEndEditing(textField: UITextField) {
//            self.animateViewMoving(up: false, moveValue: 100)
//    }
//
//    func animateViewMoving (up:Bool, moveValue :CGFloat){
//        var movementDuration:TimeInterval = 0.3
//        var movement:CGFloat = ( up ? -moveValue : moveValue)
//        UIView.beginAnimations( "animateView", context: nil)
//        UIView.setAnimationBeginsFromCurrentState(true)
//        UIView.setAnimationDuration(movementDuration )
//        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
//        UIView.commitAnimations()
//    }
}
