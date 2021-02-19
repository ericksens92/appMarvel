//
//  ComicsDetailVC.swift
//  MarvelApp
//
//  Created by Caio on 03/10/20.
//

import Foundation
import UIKit

class ComicsDetailVC:BaseViewController{
    
    @IBOutlet weak var tableViewController: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        
        
        
    }
    
    
    func configTableView(){
        self.tableViewController.delegate = self
        self.tableViewController.dataSource = self
        self.tableViewController.separatorColor = .clear
        self.tableViewController.register(HeaderComicsTableViewCell.nib(), forCellReuseIdentifier: HeaderComicsTableViewCell.identifier)
        self.tableViewController.register(BiographyTableViewCell.nib(), forCellReuseIdentifier: BiographyTableViewCell.identifier)
        self.tableViewController.register(SubViewTableViewCell.nib(), forCellReuseIdentifier: SubViewTableViewCell.identifier)
        self.tableViewController.register(OtherTableViewCell.nib(), forCellReuseIdentifier: OtherTableViewCell.identifier)
    }
    
}

extension ComicsDetailVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderComicsTableViewCell.identifier, for: indexPath) as? HeaderComicsTableViewCell
            cell?.delegate(delegate: self)
        return cell ?? UITableViewCell()
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: BiographyTableViewCell.identifier, for: indexPath)
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: SubViewTableViewCell.identifier, for: indexPath)
            return cell
        }else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: OtherTableViewCell.identifier, for: indexPath)
            return cell
        }
        
       return UITableViewCell()
    }
    
    
    
    
}

extension ComicsDetailVC: BackCaracterProtocol{
    func backComics() {
        self.dismiss(animated: true, completion: nil)
    }
}
