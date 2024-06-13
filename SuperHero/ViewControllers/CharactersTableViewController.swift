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
        fetchSuperHero()
        setupNavigationBar()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let character = superHeroes[indexPath.row]
        guard let detailVC = segue.destination as? CharacterDetailsViewController else { return }
        detailVC.character = character
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
    
    private func fetchSuperHero() {
        networkManager.fetch(dataType: [SuperHero].self, url: SuperHeroesAPI.baseURL.url) { superHeroes in
            self.superHeroes = superHeroes
            self.tableView.reloadData()
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
        let character = superHeroes[indexPath.row]
        cell.configure(with: character)
        return cell
    }
}


