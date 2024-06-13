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
func configure(with character: SuperHero?) {
    guard let character else { return }
    nameLabel.text = character.name
    networkManager.fetchImage(from: character.images.sm) { data in
        self.characterImageView.image = UIImage(data: data)
    }
    }
    }


