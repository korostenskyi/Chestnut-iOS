//
//  MovieCollectionViewCell.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 17.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Kingfisher
import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    
    // MARK: - Static
    static let identifier = "MovieCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieCollectionViewCell", bundle: nil)
    }
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Configuration
    public func configure(with movie: Movie) {
        loadImage(from: "https://image.tmdb.org/t/p/w185_and_h278_bestv2\(movie.posterPath)")
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        posterImageView.kf.setImage(with: url)
    }
}
