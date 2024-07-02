//
//  CharactersViewController.swift
//  SuperHero
//
//  Created by abd ul’Karim 📚 on 01.07.2024.
//

import UIKit
import Kingfisher


final class CharactersViewController: UICollectionViewController {

    //MARK: Private properties
    private let networkManager = NetworkManager.shared
    private var superHeroes: [SuperHero] = []
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSuperHero(from: SuperHeroesAPI.baseURL.rawValue)
        setupNavigationBar()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPaths = collectionView.indexPathsForSelectedItems,
        let indexPath = indexPaths.first else { return }
        let superHero = superHeroes[indexPath.item]
        if let detailVC = segue.destination as? CharacterDetailsViewController {
            detailVC.superHero = superHero
        }
    }
    
    // MARK: - Private methods
    
    private func setupNavigationBar() {
        title = "Super Heroes"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .black
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.orange]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func fetchSuperHero(from url: String) {
        networkManager.fetch([SuperHero].self, from: url) { [weak self] result in
            switch result {
            case .success(let superHeroes):
                self?.superHeroes = superHeroes
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension CharactersViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        superHeroes.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath
        )
        guard let cell = cell as? CollectionViewCell else { return UICollectionViewCell() }
        let superHero = superHeroes[indexPath.item]
        cell.configure(with: superHero)
        return cell
    }
}
