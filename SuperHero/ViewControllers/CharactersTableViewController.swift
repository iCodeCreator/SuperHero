//
//  CharactersTableViewController.swift
//  SuperHero
//
//  Created by abd ul’Karim 📚 on 10.06.2024.
//

import UIKit

final class CharactersTableViewController: UITableViewController {
    
    //MARK: Private properties
    private let networkManager = NetworkManager.shared
    private var superHeroes: [SuperHero] = []
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        tableView.backgroundColor = .black
        fetchSuperHero(from: SuperHeroesAPI.baseURL.rawValue)
        setupNavigationBar()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let superHero = superHeroes[indexPath.row]
        let detailVC = segue.destination as? CharacterDetailsViewController
        detailVC?.character = superHero
    }
    
    
    // MARK: - Private methods
    
    private func setupNavigationBar() {
        title = "Super Heroes"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .black
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func fetchSuperHero(from url: String) {
        networkManager.fetch([SuperHero].self, from: url) { [weak self] result in
            switch result {
            case .success(let superHeroes):
                self?.superHeroes = superHeroes
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension CharactersTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        superHeroes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        )
        guard let cell = cell as? TableViewCell else { return UITableViewCell() }
        let superHero = superHeroes[indexPath.row]
        cell.configure(with: superHero)
        return cell
    }
}


