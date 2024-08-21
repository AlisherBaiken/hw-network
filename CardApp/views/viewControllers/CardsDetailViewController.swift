//
//  CardsDetailViewController.swift
//  CardApp
//
//  Created by rbkuser on 21.08.2024.
//

import UIKit
import SnapKit

class CardDetailViewController: UIViewController {
    
    let card: Card
    
    let nameLabel = UILabel()
    let typeLabel = UILabel()
    let rarityLabel = UILabel()
    let setImage = UIImageView()
    
    init(card: Card) {
        self.card = card
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        configure()
    }
    
    private func setupViews() {
        view.addSubview(nameLabel)
        view.addSubview(typeLabel)
        view.addSubview(rarityLabel)
        view.addSubview(setImage)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
        }
        
        rarityLabel.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
        }
        
        setImage.snp.makeConstraints { make in
            make.top.equalTo(rarityLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    private func configure() {
        nameLabel.text = card.name
        typeLabel.text = card.type
        rarityLabel.text = card.rarity
        if let imageUrl = card.imageUrl, let url = URL(string: imageUrl) {
            setImage.loadImage(from: url)
        }
    }
}
