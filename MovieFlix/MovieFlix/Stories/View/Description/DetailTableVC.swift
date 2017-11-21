//
//  DetailTableVC.swift
//  MovieFlix
//
//  Created by Lorrayne Paraiso C Flor on 21/11/17.
//  Copyright © 2017 Lorrayne Paraiso C Flor. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class DetailTableVC: UITableViewController {
	
	var overview: String?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(UINib(nibName: "DescriptionCell", bundle: Bundle.main), forCellReuseIdentifier: "descriptionCell")
		tableView.separatorStyle = .none
		tableView.bounces = false
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 80
		tableView.allowsSelection = false
	}
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell") as? DescriptionCell {
			cell.overview = overview
			return cell
		}
		return UITableViewCell()
	}
}

extension DetailTableVC: IndicatorInfoProvider {
	func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
		return IndicatorInfo(title: "Description")
	}
}
