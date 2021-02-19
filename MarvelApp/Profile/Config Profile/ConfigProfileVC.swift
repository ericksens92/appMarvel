//
//  ConfigProfileVC.swift
//  MarvelApp
//
//  Created by Caio on 15/10/20.
//

import UIKit

class ConfigProfileVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Login" , sender: nil)
        
    }
    @IBAction func accountSettingButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "AccountSettingsSegue" , sender: nil)
        
    }
    
}
