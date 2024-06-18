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
            characterImageView.contentMode = .scaleAspectFit
            characterImageView.clipsToBounds = true
            characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
            characterImageView.backgroundColor = .white
        }
    }
    
    private let networkManager = NetworkManager.shared

// MARK: - Public methods
func configure(with superHero: SuperHero?) {
    guard let superHero else { return }
    nameLabel.text = superHero.name
    networkManager.fetchImage(from: superHero.images.sm) { [weak self] result in
        switch result {
        case .success(let imageData):
            self?.characterImageView.image = UIImage(data: imageData)
        case .failure(let error):
            print(error)
         }
       }
    }
}


