//
//  TableViewCell.swift
//  SuperHero
//
//  Created by abd ul’Karim 📚 on 11.06.2024.
//

import UIKit

final class TableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.contentMode = .scaleAspectFill
            characterImageView.layer.cornerRadius = 13
            characterImageView.clipsToBounds = true
            characterImageView.backgroundColor = .black
        }
    }
    
    private let networkManager = NetworkManager.shared

// MARK: - Public methods
func configure(with superHero: SuperHero?) {
    guard let superHero else { return }
    nameLabel.text = superHero.name
    networkManager.fetchImage(from: superHero.images.md) { [weak self] result in
        switch result {
        case .success(let imageData):
            self?.characterImageView.image = UIImage(data: imageData)
        case .failure(let error):
            print(error)
         }
       }
    }
}


