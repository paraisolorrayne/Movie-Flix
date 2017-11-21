//
//  BottomMovieCell.swift
//  MovieFlix
//
//  Created by Lorrayne Paraiso C Flor on 21/11/17.
//  Copyright © 2017 Lorrayne Paraiso C Flor. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class BottomMovieCell: UICollectionViewCell {
	
	@IBOutlet weak var posterImage: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
	var movie: Movie? {
		didSet {
			self.updateUI()
		}
	}
	
	func updateUI(){
		guard let movie = movie, let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)") else { return }
		let resource = ImageResource(downloadURL: url, cacheKey: movie.title)
		posterImage.kf.setImage(with: resource, placeholder: #imageLiteral(resourceName: "placer"), options: [.transition(.fade(0.3))])
		titleLabel.text = movie.title
		dateLabel.text = DateFomart.format(date: movie.releaseDate)
	}
}
