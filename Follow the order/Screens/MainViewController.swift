//
//  MainViewController.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import UIKit

class MainViewController: BaseViewController {
	
	@IBOutlet var appNameLabel: UILabel! {
		didSet {
			appNameLabel.layer.shadowColor = UIColor.white.cgColor
			appNameLabel.layer.shadowOpacity = 0.40
			appNameLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
			appNameLabel.layer.masksToBounds = false
		}
	}
	
	@IBOutlet weak var appNameLabelCenterXConstraint: NSLayoutConstraint! {
		didSet {
			appNameLabelCenterXConstraint.constant = -400
		}
	}
	
	@IBOutlet weak var startButtonCenterXConstraint: NSLayoutConstraint! {
		didSet {
			startButtonCenterXConstraint.constant = 400
		}
	}
	
	@IBOutlet weak var settingsButtonBottomConstraint: NSLayoutConstraint! {
		didSet {
			settingsButtonBottomConstraint.constant = -400
		}
	}
	
	@IBOutlet var startButton: BaseButton!
	
	@IBOutlet var settingsButton: BaseButton!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateBackground()
	}
	
	override func onFirstAppear() {
		super.onFirstAppear()
		appNameLabelCenterXConstraint.constant = 0
		startButtonCenterXConstraint.constant = 0
		settingsButtonBottomConstraint.constant = 100
		UIView.animate(withDuration: 1) {
			self.appNameLabel.transform = CGAffineTransform(rotationAngle: 0.6)
			self.startButton.transform = CGAffineTransform(rotationAngle: -0.4)
			self.settingsButton.transform = CGAffineTransform(rotationAngle: 0.3)
			self.view.layoutIfNeeded()
		} completion: { (_) in
			UIView.animate(withDuration: 0.3) {
				self.appNameLabel.transform = .identity
				self.startButton.transform = .identity
				self.settingsButton.transform = .identity
			}
		}
	}
}

