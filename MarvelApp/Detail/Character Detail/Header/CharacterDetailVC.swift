//
//  CharacterDetailVC.swift
//  MarvelApp
//
//  Created by Caio on 27/09/20.
//

import Foundation
import UIKit
import WebKit

class CharacterDetailVC:BaseViewController{
    
    @IBOutlet weak var webview: WKWebView!
    
    @IBOutlet weak var Loading: UIActivityIndicatorView!
    
    var Hero: Herois!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let url =  URL(string: Hero.urls.first!.url)
        let request = URLRequest(url: url!)
        title = Hero.name
        
        webview.allowsBackForwardNavigationGestures = true
        webview.navigationDelegate = self
        webview.load(request)
    }
            
    }

extension CharacterDetailVC : WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Loading.stopAnimating()
    }
}
    
