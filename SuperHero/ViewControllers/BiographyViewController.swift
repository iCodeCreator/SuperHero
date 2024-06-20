//
//  BiographyViewController.swift
//  SuperHero
//
//  Created by abd ul’Karim 📚 on 11.06.2024.
//

import UIKit

class BiographyViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var bioDescriptionLabel: UILabel!
    
    // MARK: - Public properties
    var superHero: SuperHero!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bioDescriptionLabel.text = superHero.biography.description
        view.backgroundColor = UIColor(
            red: 21/255,
            green: 28/255,
            blue: 43/255,
            alpha: 1
        )
    }
}
