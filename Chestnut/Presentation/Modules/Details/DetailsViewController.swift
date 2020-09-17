//
//  DetailsViewController.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 17.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Kingfisher
import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet private weak var backdropImageView: UIImageView!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    public var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        guard let movie = movie else { return }
        setupViews(with: movie)
    }
    
    private func setupViews(with movie: Movie) {
        setupBackdropImageView(with: movie.backdropPath)
        setupPosterImageView(with: movie.posterPath)
        setupTitleLabel(with: movie.title)
        setupDescriptionLabel(with: movie.overview)
    }
    
    private func setupBackdropImageView(with path: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w1280\(path)") else { return }
        backdropImageView.kf.setImage(with: url)
        backdropImageView.contentMode = .scaleToFill
    }
    
    private func setupPosterImageView(with path: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w185_and_h278_bestv2\(path)") else { return }
        posterImageView.kf.setImage(with: url)
        posterImageView.layer.shadowColor = UIColor.black.cgColor
        posterImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        posterImageView.layer.shadowOpacity = 1
        posterImageView.layer.shadowRadius = 20.0
        posterImageView.clipsToBounds = false
    }
    
    private func setupTitleLabel(with title: String) {
        titleLabel.text = title
    }
    
    private func setupDescriptionLabel(with text: String) {
        descriptionLabel.text = text
    }
}
