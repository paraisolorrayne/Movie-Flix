//
//  MockTarget.swift
//  MovieFlix
//
//  Created by Lorrayne Paraiso C Flor on 21/11/17.
//  Copyright © 2017 Lorrayne Paraiso C Flor. All rights reserved.
//

import Foundation

extension MovieTarget {
	var sampleData: Data {
		switch self {
		case .reco, .topRated, .newMovies, .video:
			return stubbedResponse("movies")
		}
	}
	
	func stubbedResponse(_ filename: String) -> Data! {
		guard let path = Bundle.main.path(forResource: filename, ofType: "json") else { fatalError("path could not be found") }
		return (try? Data(contentsOf: URL(fileURLWithPath: path)))
	}
	
}
