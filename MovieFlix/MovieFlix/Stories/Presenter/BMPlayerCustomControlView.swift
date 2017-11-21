//
//  BMPlayerCustomControlView.swift
//  MovieFlix
//
//  Created by Lorrayne Paraiso C Flor on 21/11/17.
//  Copyright © 2017 Lorrayne Paraiso C Flor. All rights reserved.
//

import Foundation
import BMPlayer

class BMPlayerCustomControlView: BMPlayerControlView {
	override func customizeUIComponents() {
		mainMaskView.backgroundColor   = UIColor.clear
		topMaskView.backgroundColor    = UIColor.black.withAlphaComponent(0.4)
		bottomMaskView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
	}
	
	override func controlViewAnimation(isShow: Bool) {
		self.isMaskShowing = isShow
		
		UIView.animate(withDuration: 0.24, animations: {
			self.topMaskView.snp.remakeConstraints {
				$0.top.equalTo(self.mainMaskView).offset(isShow ? 0 : -65)
				$0.left.right.equalTo(self.mainMaskView)
				$0.height.equalTo(65)
			}
			
			self.bottomMaskView.snp.remakeConstraints {
				$0.bottom.equalTo(self.mainMaskView).offset(isShow ? 0 : 50)
				$0.left.right.equalTo(self.mainMaskView)
				$0.height.equalTo(50)
			}
			self.layoutIfNeeded()
		}) { (_) in
			self.autoFadeOutControlViewWithAnimation()
		}
	}
}
