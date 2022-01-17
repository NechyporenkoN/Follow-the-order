//
//  MainObject.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 17.01.2022.
//

import UIKit

enum MainObject: CaseIterable {
	case apple
	case balloon
	case wheel
	case star
	
	var image: UIImage {
		switch self {
		case .apple:
			return #imageLiteral(resourceName: "apple_image")
		case .balloon:
			return #imageLiteral(resourceName: "balloon_image")
		case .wheel:
			return #imageLiteral(resourceName: "wheel_image")
		case .star:
			return #imageLiteral(resourceName: "star_image")
		}
	}
}
