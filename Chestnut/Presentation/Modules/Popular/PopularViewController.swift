//
//  ViewController.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 16.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController {

    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    // TODO: - Inject it (see ViewModelProvider (Android style))
    lazy var viewModel = PopularViewModel()
    
    private var popularMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchData()
    }
    
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
    
    private func fetchData() {
        viewModel.fetchMovies() { [weak self] movies in
            self?.popularMovies += movies
            DispatchQueue.main.async {
                self?.movieCollectionView.reloadData()
            }
        }
    }
}

extension PopularViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You tapped me...")
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
}

extension PopularViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 240)
    }
}

