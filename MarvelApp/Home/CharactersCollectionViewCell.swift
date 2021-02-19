//
//  CharactersCollectionViewCell.swift
//  MarvelApp
//
//  Created by Erick Sens on 25/10/20.
//

import UIKit
import Kingfisher

class CharactersCollectionViewCell: UICollectionViewCell {
   

    @IBOutlet weak var Charecter: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var name = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func prepareCell(with hero: Herois){
        label.text = hero.name
        if let url = URL(string: hero.thumbnail.url)
        {
            Charecter.kf.indicatorType = .activity
            Charecter.kf.setImage(with: url)
        }else
        {
            Charecter.image = nil
        }
        
    }
    }


