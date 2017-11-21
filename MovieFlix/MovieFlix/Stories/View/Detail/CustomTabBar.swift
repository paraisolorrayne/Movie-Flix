//
//  CustomTabBar.swift
//  MovieFlix
//
//  Created by Lorrayne Paraiso C Flor on 21/11/17.
//  Copyright © 2017 Lorrayne Paraiso C Flor. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class CustomTabBar: ButtonBarPagerTabStripViewController {
	
	let selectedColor = UIColor.flatGreenColorDark()
	
	let tabOne = DetailTableVC()
	let tabTwo = RecomendationsTableVC()
	var pushDelegate: PushDelegate?
	
	var overview: String?
	var movieID: Int?
	
	override func viewDidLoad() {
		style()
		tabOne.overview = overview
		tabTwo.movieID = movieID
		super.viewDidLoad()
		tabTwo.delegate = pushDelegate
	}
	
	override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
		return [tabOne, tabTwo]
	}
	
	func style(){
		guard let color = selectedColor else { fatalError("no color") }
		settings.style.selectedBarHeight = 1
		settings.style.selectedBarBackgroundColor = color
		settings.style.buttonBarItemBackgroundColor = .clear
		settings.style.buttonBarBackgroundColor = .white
		settings.style.buttonBarMinimumLineSpacing = 0
		settings.style.buttonBarItemTitleColor = .lightGray
		
		changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
			guard changeCurrentIndex == true else { return }
			oldCell?.label.textColor = .lightGray
			newCell?.label.textColor = self?.selectedColor
		}
	}
}
