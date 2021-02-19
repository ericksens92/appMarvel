//
//  Search.swift
//  MarvelApp
//
//  Created by Erick Sens on 25/10/20.
//

import UIKit

class Search: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tfName: UITextField!
   
    
    var arrayDataSource = [Personagem]()
    override func viewDidLoad() {
        super.viewDidLoad()
            
        

    }
    
    @IBAction func CharacterButton(_ sender: Any) {
        print("testando")
        self.performSegue(withIdentifier: "resultView", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "resultView" {
//            if let resultViewController = segue.destination as? CollectionSearch {
//                resultViewController.name = name
//
//            }
//        }
        let vc = segue.destination as! CollectionSearch
        vc.name = tfName.text
    }

}

extension Search: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        name = name.filter({$0.nome.lowercased().contains(searchText.lowercased())})
//
    }
    
}

