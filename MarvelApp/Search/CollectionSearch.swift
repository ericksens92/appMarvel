//
//  CollectionSearch.swift
//  MarvelApp
//
//  Created by Erick Sens on 29/10/20.
//

import UIKit

class CollectionSearch : UIViewController {
    
    var Hero : [Herois] = []
    var name : String?

    @IBOutlet weak var collectionViewSearch: UICollectionView!
   
    var loadingHero = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadHero()
        self.collectionViewSearch.register(UINib(nibName: "SearchCharactersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchCharactersCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 170, height: 200)
        self.collectionViewSearch.collectionViewLayout = layout
        self.collectionViewSearch.reloadData()

    }
    
    func LoadHero(){
        loadingHero = true
        MarvelAPI.loadHeros(name: name, page: 0) { (info) in
            if let info = info {
                self.Hero += info.data.results
                DispatchQueue.main.async {
                    self.loadingHero = false
                    self.collectionViewSearch.reloadData()
                }
            }
        }
    }
}

extension CollectionSearch: UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Hero.count

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SearchCharactersCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCharactersCollectionViewCell", for: indexPath) as? SearchCharactersCollectionViewCell
        let hero = Hero[indexPath.row]
        cell?.prepareCell(with: hero)
        return cell ?? UICollectionViewCell()
    }
}





