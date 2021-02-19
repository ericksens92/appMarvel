//
//  detailExpationImage.swift
//  MarvelApp
//
//  Created by Caio on 27/09/20.
//

import Foundation
import UIKit

class DetailExpationImg:BaseViewController{
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    var model:Model?
    var imageDescription:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.image.image = UIImage(named:imageDescription ?? "")
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        print("tapped")
        self.dismiss(animated: true, completion: nil)
    }
    
}
