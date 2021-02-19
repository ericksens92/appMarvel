//
//  OtherTableViewCell.swift
//  MarvelApp
//
//  Created by Caio on 03/10/20.
//

import UIKit

protocol SelectedCollectionOtherTableViewCellProtocol: class{
    func descritionImage(nome:String)
}


class OtherTableViewCell:UITableViewCell{

    @IBOutlet weak var otherLabel: UILabel!
    @IBOutlet weak var collectionViewController: UICollectionView!
    weak var delegate:SelectedCollectionOtherTableViewCellProtocol?
    
    func delegate(delegate:SelectedCollectionOtherTableViewCellProtocol){
        self.delegate = delegate
    }
    
    static let identifier = "OtherTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "OtherTableViewCell", bundle: nil)
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configCollectionView()
    }
    
    func configCollectionView(){
        self.collectionViewController.delegate = self
        self.collectionViewController.dataSource = self
        self.collectionViewController.register(OtherCollectionViewCell.nib(), forCellWithReuseIdentifier: OtherCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension OtherTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OtherCollectionViewCell.identifier, for: indexPath) as! OtherCollectionViewCell
    
        cell.nomeLabel.text = "Fulado de Tal"
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        self.delegate?.descritionImage(nome: "")
    }
    
}
