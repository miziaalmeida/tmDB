//
//  HomeViewController.swift
//  TheMovie
//
//  Created by Jeiel Lima on 09/04/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let apiManager = APIManager()
    private var movies: [Movie] = []
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorConstants.backColor
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupTableView()
        fetchPopularMovies()
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    private func fetchPopularMovies() {
        print("Fetching...")
        apiManager.getPopularMovies { [weak self] movies in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let movies = movies {
                    print("Pegooooou: \(movies)")
                    self.movies = movies
                    self.tableView.reloadData()
                } else {
                    print("Achou não..")
                    self.showErrorAlert()
                }
            }
        }
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Falhou meu chapa", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showMovieDetails(movie: Movie) {
        print("Filme: \(movie.title)")
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = movies[indexPath.row]
        showMovieDetails(movie: movie)
    }
}

