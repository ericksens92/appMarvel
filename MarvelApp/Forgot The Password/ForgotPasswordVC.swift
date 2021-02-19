//
//  ForgotPasswordVC.swift
//  MarvelApp
//
//  Created by Amanda Nolasco on 09/10/20.
//

import UIKit

class ForgotPasswordVC: BaseViewController{
    
    
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configScreen()
        
       
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
    }
    
    
    func configScreen(){
        
        self.updateButton.layer.cornerRadius = 25
        self.updateButton.layer.borderWidth = 3
        self.updateButton.layer.borderColor = UIColor.white.cgColor
        self.cpfTextField.layer.cornerRadius = 30
        self.passwordTextField.layer.cornerRadius = 30
        self.confirmPasswordTextField.layer.cornerRadius = 30
        self.cpfTextField.layer.masksToBounds = true
        self.passwordTextField.layer.masksToBounds = true
        self.confirmPasswordTextField.layer.masksToBounds = true
        self.cpfTextField.attributedPlaceholder = NSAttributedString(string: "CPF", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        self.passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        self.confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    
    }
    
    
    @IBAction func tappedUpdateButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Erro", message: "Dados incorretos", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        if !validCPF(textField: cpfTextField.text!) || !validPassword(passwordTextField: passwordTextField.text!, confirmPasswordTextField: confirmPasswordTextField.text!){
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func showLogin(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    func validCPF(textField: String) -> Bool {
       return  true//textField.isCPF
       
        }
    
    func validPassword(passwordTextField: String,confirmPasswordTextField: String ) -> Bool {
        
        return (passwordTextField.count >= 6 && confirmPasswordTextField.count >= 6) && (passwordTextField == confirmPasswordTextField)
    }

}
