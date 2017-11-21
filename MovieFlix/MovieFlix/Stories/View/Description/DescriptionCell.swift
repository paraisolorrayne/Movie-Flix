//
//  DescriptionCell.swift
//  MovieFlix
//
//  Created by Lorrayne Paraiso C Flor on 21/11/17.
//  Copyright © 2017 Lorrayne Paraiso C Flor. All rights reserved.
//

import Foundation
import UIKit

class DescriptionCell: UITableViewCell {
	
	@IBOutlet weak var overviewLabel: UILabel!
	var overview: String? {
		didSet {
			self.updateUI()
		}
	}
	
	func updateUI(){
		overviewLabel.text = overview
	}
	
}
