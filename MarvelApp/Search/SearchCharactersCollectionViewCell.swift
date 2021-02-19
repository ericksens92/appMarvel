//
//  CharactersCollectionViewCell.swift
//  MarvelApp
//
//  Created by Erick Sens on 26/10/20.
//

import UIKit
import Kingfisher

class SearchCharactersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Character: UIImageView!
    
    @IBOutlet weak var LblNome: UILabel!
  
    var name:String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func prepareCell(with hero: Herois){
        self.LblNome.text = hero.name
        if let url = URL(string: hero.thumbnail.url){
            Character.kf.indicatorType = .activity
            Character.kf.setImage(with: url)
            debugPrint(url)
        } else {
            Character.image = nil
        }
    }
}

