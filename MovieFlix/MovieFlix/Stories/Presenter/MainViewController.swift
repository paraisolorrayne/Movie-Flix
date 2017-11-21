//
//  MainViewController.swift
//  MovieFlix
//
//  Created by Lorrayne Paraiso C Flor on 21/11/17.
//  Copyright © 2017 Lorrayne Paraiso C Flor. All rights reserved.
//

import Foundation
import UIKit
import Hero
import SwiftIcons
import Moya



class MainViewController: UIViewController {
	
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var stackView: UIStackView!
	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var popularMoviesCVC: UICollectionView!
	@IBOutlet weak var newMoviesCVC: UICollectionView!
	@IBOutlet weak var tvCVC: UICollectionView!
	
	var currentMovies: [Movie]!
	var topRatedMovies: [Movie]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		getMovies()
	}
	
	func getMovies(){
		API.getTopRated(page: 1, completion: { movies in
			self.topRatedMovies = movies as! [Movie]
			self.popularMoviesCVC.reloadData()
		})
		
		API.getNewMovies(page: 1) { movies in
			self.currentMovies = movies
			self.newMoviesCVC.reloadData()
		}
		
	}
	
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if collectionView == popularMoviesCVC {
			if let cell = popularMoviesCVC.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as? TopMovieCell {
				cell.movie = topRatedMovies[indexPath.row]
				return cell
			}
		}else if collectionView == newMoviesCVC {
			if let cell = newMoviesCVC.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as? BottomMovieCell {
				cell.movie = currentMovies[indexPath.row]
				return cell
			}
		}
		return UICollectionViewCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if collectionView == popularMoviesCVC {
			if topRatedMovies == nil {
				return 0
			}
			return topRatedMovies.count
		}else if collectionView == newMoviesCVC {
			if currentMovies == nil {
				return 0
			} else {return currentMovies.count}
		}
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if collectionView == popularMoviesCVC {
			if let detailVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "detailVC") as? DetailViewController {
				detailVC.movie = topRatedMovies[indexPath.row]
				self.navigationController?.pushViewController(detailVC, animated: true)
			}
		}else if collectionView == newMoviesCVC {
			if let detailVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "detailVC") as? DetailViewController {
				detailVC.movie = currentMovies[indexPath.row]
				self.navigationController?.pushViewController(detailVC, animated: true)
			}
		}
	}
}
