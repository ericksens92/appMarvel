//
//  SubViewTableViewCell.swift
//  MarvelApp
//
//  Created by Caio on 29/09/20.
//

import UIKit

class SubViewTableViewCell: UITableViewCell {

    static let identifier = "SubViewTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "SubViewTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
