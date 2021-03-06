//
//  ViewController.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 16.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var movieCollectionView: UICollectionView!
    
    var viewModel: PopularViewModel!
    var popularMovieCoordinator: PopularViewControllerCoordinator!
    
    private var popularMovies = [Movie]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.movieCollectionView.reloadData()
            }
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchData(on: viewModel.page)
    }
    
    // MARK: - View configuration
    private func setupViews() {
        setupNavigationBar()
        setupMovieCollectionView()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Chestnut"
    }
    
    private func setupMovieCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 240)
        movieCollectionView.collectionViewLayout = layout
        movieCollectionView.register(MovieCollectionViewCell.nib(), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
    }
    
    // MARK: - Fetch data
    private func fetchData(on page: Int) {
        viewModel.fetchMovies(on: page) { [weak self] movies in
            self?.popularMovies += movies
        }
    }
}

extension PopularViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let movie = popularMovies[indexPath.item]
        popularMovieCoordinator.showDetails(for: movie)
    }
}

extension PopularViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            print("Cannot dequeue MovieCollectionViewCell")
            return UICollectionViewCell()
        }
        cell.configure(with: popularMovies[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == popularMovies.count - 1 {
            viewModel.page += 1
            fetchData(on: viewModel.page)
        }
    }
}

extension PopularViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 240)
    }
}

