//
//  BaseObject.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import UIKit

protocol BaseObjectProtocol: AnyObject {
	var orderNumber: Int? { get set }
	func animate()
}

class BaseObject: UIControl {
	
	let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	 override init(frame: CGRect) {
		super.init(frame: frame)
		 self.addSubview(imageView)
		 setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: self.topAnchor),
			imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
		])
	}
}

enum MainObject: String {
	case apple
	case balloon
	case wheel
	case star
}
