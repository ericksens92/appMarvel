//
//  ViewController.swift
//  MarvelApp
//
//  Created by Caio on 21/09/20.
//

import UIKit
import Firebase
import FirebaseAuth
class LoginVC: BaseViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var name = ""
    var senha = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.configScreen()
        
    }

    func configScreen(){
        self.loginButton.layer.cornerRadius = 30
        self.loginButton.layer.borderWidth = 3
        self.loginButton.layer.borderColor = UIColor.white.cgColor
        self.usernameTextField.layer.cornerRadius = 30
        self.passwordTextField.layer.cornerRadius = 30
        self.usernameTextField.layer.masksToBounds = true
        self.passwordTextField.layer.masksToBounds = true
        self.usernameTextField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        self.usernameTextField.text = name
        self.passwordTextField.text = senha
        
    }
    
    func Login(withEmail email: String , password:String ){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("falha ao logar :",error.localizedDescription)
                let alerta = ValidaFormulario().exibeNotificacaoPreenchidos(titulo: "Erro", mensagem: "Digite os campos corretamente ")
                
                self.present(alerta, animated: true, completion: nil)
                return
            }
        
            print("Login realizado com sucesso")
            self.performSegue(withIdentifier: "homeTabBar" , sender: nil)
        }
            }
   
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        guard let email = usernameTextField.text else {return}
        guard let senha = passwordTextField.text else {return}
        
        Login(withEmail: email, password: senha)
        
        
    }
    
    @IBAction func tappedSignUpButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignUp", sender: nil)
    }
    @IBAction func tappedForgotPasswordButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ForgotPassword", sender: nil)
    }
}

