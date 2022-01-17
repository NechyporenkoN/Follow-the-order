//
//  UIViewUtils.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import UIKit

extension UIView {
	
	func shake() {
		let propertyAnimator = UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.3) {
			self.transform = CGAffineTransform(translationX: 10, y: 0)
		}
		propertyAnimator.addAnimations({
			self.transform = CGAffineTransform(translationX: 0, y: 0)
		}, delayFactor: 0.2)
		propertyAnimator.startAnimation()
	}
	
	func rotate() {
		let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
		rotation.toValue = NSNumber(value: Double.pi * 2)
		rotation.duration = 1
		rotation.isCumulative = true
		rotation.repeatCount = Float.greatestFiniteMagnitude
		self.layer.add(rotation, forKey: "rotationAnimation")
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.layer.removeAllAnimations()
		}
	}
	
	func biggerWithAnimation() {
		UIView.animate(withDuration: 0.4, animations: {
			self.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
		}) { (_) in
			UIView.animate(withDuration: 0.4, animations: {
				self.transform = CGAffineTransform(scaleX: 1, y: 1)
			})
		}
	}
	
	func flip() {
		UIView.transition(with: self, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
	}
}
