//
//  API.swift
//  MovieFlix
//
//  Created by Lorrayne Paraiso C Flor on 21/11/17.
//  Copyright © 2017 Lorrayne Paraiso C Flor. All rights reserved.
//

import Foundation
import Moya
import YoutubeSourceParserKit

class API {
	
	static let apiKey = "625a7cbd9e0ae06da951620f6f0015d1"
	
	//2. Debug
	static let provider = MoyaProvider<MovieTarget>(plugins: [NetworkLoggerPlugin(verbose: true)])
	
	static func getNewMovies(page: Int, completion: @escaping ([Movie])->()){
		
		provider.request(.newMovies(page: page)) { result in
			
			switch result {
			case let .success(response):
				do {
					let results = try JSONDecoder().decode(APIResults.self, from: response.data)
					completion(results.movies)
				}catch let err{
					print(err)
				}
			case let .failure(error):
				print(error)
			}
		}
	}
	
	static func getTopRated(page: Int, completion: @escaping ([Movie?])->()){
		provider.request(.topRated(page: page)) { result in
			switch result {
			case let .success(response):
				do {
					let results = try JSONDecoder().decode(APIResults.self, from: response.data)
					completion(results.movies)
				}catch let err{
					print(err)
				}
			case let .failure(error):
				print(error)
			}
		}
	}
	
	static func getRecommendations(forMovieWith id: Int, completion: @escaping ([Movie]?)->()){
		provider.request(.reco(id: id)) { result in
			switch result {
			case let .success(response):
				do {
					let results = try JSONDecoder().decode(APIResults.self, from: response.data)
					completion(results.movies)
				}catch let err{
					print(err)
				}
			case let .failure(error):
				print(error)
			}
		}
	}
	
	static func getVideo(forMovieWith id: Int, completion: @escaping (String?)->()){
		provider.request(.video(id: id)){ result in
			switch result {
			case let .success(response):
				do {
					let videos = try JSONDecoder().decode(VideoResults.self, from: response.data)
					guard let videoURL = URL(string: "https://www.youtube.com/watch?v=\(videos.details[0].key)") else {return}
					Youtube.h264videosWithYoutubeURL(videoURL) { videoInfo, error in
						if let videoURLString = videoInfo?["url"] as? String {
							completion(videoURLString)
						}else{
							guard let placeHolderUrl = URL(string: "https://www.youtube.com/watch?v=NpEaa2P7qZI") else {return}
							Youtube.h264videosWithYoutubeURL(placeHolderUrl) { videoInfo, error in
								if let placeHolderVideoUrl = videoInfo?["url"] as? String {
									completion(placeHolderVideoUrl)
								}
							}
						}
					}
				} catch let err {
					print(err)
				}
			case let .failure(error):
				print(error)
			}
		}
	}
	
}
