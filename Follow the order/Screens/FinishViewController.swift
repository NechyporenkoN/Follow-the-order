//
//  FinishViewController.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import UIKit

class FinishViewController: BaseViewController {
	
	@IBOutlet var backgroundView: UIView! {
		didSet {
			backgroundView.alpha = 0.4
			backgroundView.layer.cornerRadius = 10
			backgroundView.layer.borderWidth = 3
			backgroundView.layer.borderColor = UIColor.systemBlue.cgColor
		}
	}
	
	@IBOutlet var titleLabel: UILabel!
	
	@IBOutlet var messageLabel: UILabel!
	
	var type: ResultType?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureNavigationItems()
		configureView()
	}
	
	private func configureNavigationItems() {
		let closeButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(close))
		navigationItem.leftBarButtonItem = closeButton
	}
	
	private func configureView() {
		guard let type = type else { return }
		createParticles()
		switch type {
		case .victory:
			sendRequest()
			titleLabel.text = "Congratulations"
		case .loss:
			titleLabel.text = "Oooops"
			messageLabel.text = "try again"
		}
	}
	
	func createParticles() {
		let particleEmitter = CAEmitterLayer()
		particleEmitter.zPosition = -1
		particleEmitter.emitterPosition = CGPoint(x: view.frame.width / 2.0, y: -50)
		particleEmitter.emitterShape = .line
		
		let cell = CAEmitterCell()
		let image = #imageLiteral(resourceName: type == .loss ? "sad_emoji" : "lollipop_emoji").cgImage
		cell.contents = image
		cell.birthRate = 1
		cell.lifetime = 50
		cell.velocity = 25
		cell.velocityRange = 50
		cell.emissionLongitude = (180 * (.pi/180))
		cell.emissionRange = (45 * (.pi/180))
		cell.spinRange = 5
		cell.scale = 0.4
		cell.scaleRange = 0.3
		
		particleEmitter.emitterCells = [cell]
		
		view.layer.addSublayer(particleEmitter)
	}
	
	private func sendRequest() {
		RequestService.getText(requestURL: Application.shared.link, comletion: { message in
			self.messageLabel.text = message?.fortune
			UIView.animate(withDuration: 0.4) {
				self.view.layoutIfNeeded()
			}
		})
	}
	
	@objc private func close() {
		self.dismiss(animated: false, completion: nil)
	}
}

enum ResultType {
	case victory
	case loss
}
