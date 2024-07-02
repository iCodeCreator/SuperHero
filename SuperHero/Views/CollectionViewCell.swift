//
//  CollectionViewCell.swift
//  SuperHero
//
//  Created by abd ul’Karim 📚 on 01.07.2024.
//

import UIKit
import Kingfisher

final class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 15
        }
    }
    
    private let networkManager = NetworkManager.shared

// MARK: - Public methods
    
func configure(with superHero: SuperHero?) {
    guard let superHero else { return }
    mainLabel.text = superHero.name
    let imageURL = URL(string: superHero.images.md)
    imageView.kf.indicatorType = .activity
    imageView.kf.setImage(with: imageURL)
    }
}
