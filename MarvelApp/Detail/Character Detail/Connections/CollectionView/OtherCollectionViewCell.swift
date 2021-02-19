//
//  OtherCollectionViewCell.swift
//  MarvelApp
//
//  Created by Caio on 03/10/20.
//

import UIKit

class OtherCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    

    static let identifier = "OtherCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "OtherCollectionViewCell", bundle: nil)
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
