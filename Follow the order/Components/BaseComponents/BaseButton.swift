//
//  BaseButton.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import UIKit

class BaseButton: UIButton {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	private func setup() {
		self.layer.cornerRadius = 10
		self.layer.borderWidth = 2
		self.layer.borderColor = UIColor.systemBlue.cgColor
		self.backgroundColor = .white
	}
}
