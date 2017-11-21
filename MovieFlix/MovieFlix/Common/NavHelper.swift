//
//  NavHelper.swift
//  MovieFlix
//
//  Created by Lorrayne Paraiso C Flor on 21/11/17.
//  Copyright © 2017 Lorrayne Paraiso C Flor. All rights reserved.
//

import Foundation
import UIKit
import Hero
import SwiftIcons
import BonMot
import ChameleonFramework

class NavHelper {
	static func transition(to id:String, in storyboard:String, with transition: HeroDefaultAnimationType, from currentView:UIViewController){
		let toVC = UIStoryboard(name: storyboard, bundle: Bundle.main).instantiateViewController(withIdentifier: id)
		toVC.isHeroEnabled = true
		currentView.navigationController?.heroNavigationAnimationType = transition
		currentView.hero_replaceViewController(with: toVC)
		
	}
	
	static func configureNavBar(on currentView: UIViewController, leftButtonAction: String){
		
		let leftButton = UIButton.init(type: .custom)
		let rightButton = UIButton.init(type: .custom)
		
		let CinemaTitleview = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
		let label = UILabel(frame: CGRect(x: 0, y: 11, width: 150, height: 30))
		label.textAlignment = .center
		
		leftButton.setImage(UIImage.init(icon: .dripicon(.menu), size: CGSize(width: 30, height: 30), textColor: .flatWhite()), for: UIControlState.normal)
		rightButton.setImage(UIImage.init(icon: .fontAwesome(.user), size: CGSize(width: 30, height: 30), textColor: .flatWhite()), for: UIControlState.normal)
		let whiteBoldStyle = StringStyle(
			.font(UIFont(name: "Baskerville-BoldItalic", size: 25)!),
			.color(.white)
		)
		
		label.attributedText = "Movies".styled(with: whiteBoldStyle)
		CinemaTitleview.addSubview(label)
		currentView.navigationItem.titleView = CinemaTitleview
		
		leftButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
		let barButton = UIBarButtonItem(customView: leftButton)
		currentView.navigationItem.leftBarButtonItem = barButton
		
		rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
		let rightbarButton = UIBarButtonItem(customView: rightButton)
		currentView.navigationItem.rightBarButtonItem = rightbarButton
		currentView.navigationController?.isNavigationBarHidden = false
	}
	
	static func configureBackNav(on currentView: UIViewController, leftButtonAction: String){
//		let leftButton = UIButton.init(type: .custom)
//		leftButton.setImage(UIImage.init(icon: .linearIcons(.arrowLeft), size: CGSize(width: 30, height: 30), textColor: .flatWhite()), for: UIControlState.normal)
//		leftButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//		leftButton.addTarget(currentView, action: Selector(leftButtonAction), for: .touchUpInside)
//		let barButton = UIBarButtonItem(customView: leftButton)
//		currentView.navigationItem.leftBarButtonItem = barButton
//		currentView.navigationController?.isNavigationBarHidden = false
	}
}
