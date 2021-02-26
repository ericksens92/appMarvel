//
//  HomeVC.swift
//  MarvelApp
//
//  Created by Caio on 15/10/20.
//

import UIKit

class HomeVC: BaseViewController{
    
    @IBOutlet weak var HomeCollectionView: UICollectionView!
    var name = ""
    var arrayHero : [Herois] = []
   
    var currentPage = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadHero()
       
      
        self.HomeCollectionView.register(UINib(nibName: "CharactersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CharactersCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 180, height: 200)
        self.HomeCollectionView.collectionViewLayout = layout
        self.HomeCollectionView.delegate = self
        self.HomeCollectionView.dataSource = self
    
    }
   /* override func prepare(for segue :UIStoryboardSegue, sender: Any? ){
        let vc = segue.destination as! CharacterDetailVC
        vc.hero = arrayHero[HomeCollectionView.indexPathsForSelectedItems]
    }
    */
    func loadHero(){
        MarvelAPI.loadHeros(name: name, page: currentPage) { (info) in
            if let info = info {
                self.arrayHero += info.data.results
                self.total = info.data.total
                DispatchQueue.main.async {
                    self.HomeCollectionView.reloadData()
                }
            }
        }
    }
}



extension HomeVC:UICollectionViewDelegate ,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayHero.count    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CharactersCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "CharactersCollectionViewCell", for: indexPath) as? CharactersCollectionViewCell
        let hero = arrayHero[indexPath.row]
        cell?.prepareCell(with: hero)
        return cell ?? UICollectionViewCell()
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "teste" , sender: arrayHero[indexPath.row])
     
  
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
        if let vc = segue.destination as? CharacterDetailVC{
            if let hero = sender as? Herois{
                
                vc.Hero = hero
            }
            
        }
        
    }
}
extension HomeVC: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 200)
        
    }
}
