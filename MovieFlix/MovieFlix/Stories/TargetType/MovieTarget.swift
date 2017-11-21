//
//  MovieTarget.swift
//  MovieFlix
//
//  Created by Lorrayne Paraiso C Flor on 21/11/17.
//  Copyright © 2017 Lorrayne Paraiso C Flor. All rights reserved.
//

import Foundation
import Moya

enum MovieTarget {
	case reco(id:Int)
	case topRated(page:Int)
	case newMovies(page:Int)
	case video(id:Int)
}

extension MovieTarget: TargetType {

	static let apiKey = "625a7cbd9e0ae06da951620f6f0015d1"
	
	var baseURL: URL {
		guard let url = URL(string: "https://api.themoviedb.org/3/movie/") else { fatalError("baseURL could not be configured") }
		return url
	}
	
	var headers: [String : String]? {
		return nil
	}
	
	var path: String {
		switch self {
		case .reco(let id):
			return "\(id)/recommendations"
		case .topRated:
			return "popular"
		case .newMovies:
			return "now_playing"
		case .video(let id):
			return "\(id)/videos"
		}
	}
	
	var method: Moya.Method {
		switch self {
		case .reco, .topRated, .newMovies, .video:
			return .get
		}
	}
	
	var parameters: [String : Any]? {
		switch self {
		case .reco, .video:
			return ["api_key": API.apiKey]
		case .topRated(let page), .newMovies(let page):
			return ["page": page, "api_key": API.apiKey]
		}
	}
	
	var parameterEncoding: ParameterEncoding {
		switch self {
		case .reco, .topRated, .newMovies, .video:
			return URLEncoding.queryString
		}
	}
	
	var task: Task {
		switch self {
		case .reco, .topRated, .newMovies, .video:
			return .requestPlain
		}
	}
}
