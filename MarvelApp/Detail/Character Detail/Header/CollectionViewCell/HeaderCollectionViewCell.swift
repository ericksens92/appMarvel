//
//  HeaderCollectionViewCell.swift
//  MarvelApp
//
//  Created by Caio on 27/09/20.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var image: UIImageView!
    
    static let identifier = "HeaderCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "HeaderCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func configure(with model:Model){
    self.image.image = UIImage(named: model.image ?? "")
    }
    
}
