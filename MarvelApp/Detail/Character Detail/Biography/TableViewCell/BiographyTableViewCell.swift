//
//  BiographyTableViewCell.swift
//  MarvelApp
//
//  Created by Caio on 29/09/20.
//

import UIKit

class BiographyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    
    static let identifier = "BiographyTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "BiographyTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func config(whit model:[Model]){
       
    }
    
    
}
