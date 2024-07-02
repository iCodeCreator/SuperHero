//
//  CharacterDetailsViewController.swift
//  SuperHero
//
//  Created by abd ul’Karim 📚 on 11.06.2024.
//

import UIKit
import Kingfisher

final class CharacterDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var characterImageView: UIImageView! {
        didSet {
            characterImageView.contentMode = .scaleAspectFill
            characterImageView.layer.cornerRadius = 15
            characterImageView.clipsToBounds = true
            characterImageView.backgroundColor = .black
        }
    }
    // MARK: - Public properties
    var superHero: SuperHero?
    
    // MARK: - Private Properties
 
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let superHero else { return }
        title = superHero.name
        descriptionLabel.text = superHero.description
        fetchImage(with: superHero)

    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bioVC = segue.destination as? BiographyViewController
        bioVC?.superHero = superHero
    }
    
    // MARK: - Private Methods
    
    private func fetchImage(with superHero: SuperHero) {
        let imageURL = URL(string: superHero.images.md)
        characterImageView.kf.indicatorType = .activity
        characterImageView.kf.setImage(with: imageURL)
    }
}
