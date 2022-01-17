//
//  Star.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import UIKit

final class Star: BaseObject, BaseObjectProtocol {
	
	var orderNumber: Int?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		imageView.image = MainObject.star.image
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func animate() {
		self.flip()
	}
}
