//
//  Apple.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import UIKit

final class Apple: BaseObject, BaseObjectProtocol {
	
	var orderNumber: Int?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		imageView.image = MainObject.apple.image
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func animate() {
		self.shake()
	}
}
