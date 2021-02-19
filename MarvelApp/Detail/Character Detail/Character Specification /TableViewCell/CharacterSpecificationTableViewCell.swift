//
//  CharacterSpecificationTableViewCell.swift
//  MarvelApp
//
//  Created by Caio on 29/09/20.
//

import UIKit

class CharacterSpecificationTableViewCell: UITableViewCell {

    @IBOutlet weak var backGroundView: UIView!
    
    static let identifier = "CharacterSpecificationTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "CharacterSpecificationTableViewCell", bundle: nil)
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backGroundView.layer.borderWidth = 3
        self.backGroundView.layer.borderColor = UIColor.lightGray.cgColor
        self.backGroundView.clipsToBounds = true
        self.backGroundView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
