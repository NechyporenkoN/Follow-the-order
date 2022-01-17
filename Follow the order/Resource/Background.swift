//
//  Background.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 17.01.2022.
//

import UIKit

enum Background: String, CaseIterable {
	case clouds
	case white
	case bluePixel
	case lightWave
	case halloween
	
	var image: UIImage {
		switch self {
		case .clouds:
			return #imageLiteral(resourceName: "clouds_bg")
		case .white:
			return #imageLiteral(resourceName: "white_bg")
		case .bluePixel:
			return #imageLiteral(resourceName: "blue_pixel_bg")
		case .lightWave:
			return #imageLiteral(resourceName: "light_wave_bg")
		case .halloween:
			return #imageLiteral(resourceName: "halloween_bg")
		}
	}
}
