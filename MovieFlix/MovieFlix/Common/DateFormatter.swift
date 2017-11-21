//
//  DateFormatter.swift
//  MovieFlix
//
//  Created by Lorrayne Paraiso C Flor on 21/11/17.
//  Copyright © 2017 Lorrayne Paraiso C Flor. All rights reserved.
//

import Foundation
class DateFomart {
	static let instance = DateFormatter()
	
	static func format(date: String) -> String {
		instance.dateFormat = "yyyy-MM-dd"
		guard let date = instance.date(from: date) else { fatalError("could not format date") }
		instance.dateFormat = "MMM, dd"
		return instance.string(from: date)
	}
}
