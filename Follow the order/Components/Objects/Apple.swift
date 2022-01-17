//
//  Apple.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import UIKit

class Apple: BaseObject, BaseObjectProtocol {
	
	var orderNumber: Int?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		imageView.image = #imageLiteral(resourceName: "apple_image")
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func animate() {
		self.shake()
	}
}
