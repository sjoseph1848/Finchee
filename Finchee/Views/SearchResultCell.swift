//
//  SearchResultCell.swift
//  Finchee
//
//  Created by Samuel Joseph on 6/22/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    let appIconImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.backgroundColor = .white
        //width of objects in stackView
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        
        // to make this one appear you need to give it a height anchor
        
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        return iv
    }()
    
    let nameLabel:UILabel = {
        
        let label = UILabel()
        label.text = "STOCK NAME"
        label.textColor = .white
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "INDUSTRY"
        label.textColor = .white    
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        label.textColor = .white
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("VIEW",for:.normal)
        button.setTitleColor(.black,for:.normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white:0.95,alpha:1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        backgroundColor = .black
        
        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel,categoryLabel,ratingsLabel])
        labelsStackView.axis = .vertical
        
        
        let stackView = UIStackView(arrangedSubviews: [appIconImageView,labelsStackView,getButton])
        
        stackView.spacing = 12
        stackView.alignment = .center
        
        addSubview(stackView)
        
        //add constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo:self.leadingAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: -16).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
