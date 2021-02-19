//
//  CustomSegmentedControl.swift
//  MarvelApp
//
//  Created by Amanda Nolasco on 25/10/20.
//

import UIKit

@IBDesignable

class CustomSegmentedControl: UIView {
    
 var items = [UIButton]()
    
@IBInspectable
    var borderWidth: CGFloat = 0{
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
@IBInspectable
    var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
}
    
    @IBInspectable
    var segmentedItems: String = "" {
        didSet{
            updateView()
        }
    
}
    
    func updateView() {
        items.removeAll()
        subviews.forEach{ $0.removeFromSuperView() }
        
        let itemTitles = segmentedItems.components(separatedBy: ",")
        for itemTitle in itemTitles {
            let item =  UIButton(type: .system)
            item.setTitle(itemTitle, for: .normal)
            items.append(item)
            
        }
        
        let sv = UIStackView(arrangedSubviews: items)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        
        
    }
    
    override func draw(_ rect: CGRect) {
        
        layer.cornerRadius = frame.height/2
        
    }
    

}

