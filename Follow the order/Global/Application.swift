//
//  Application.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import Foundation
import UIKit

class Application {
	
	static var shared = Application()
	
	private init() {}
	
	var backgroundImageName: String? {
		get {
			return UserDefaults.standard.string(forKey: UserDefaultsKey.backgroundImageName.rawValue)
		}
		set(newValue){
			UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.backgroundImageName.rawValue)
		}
	}
	
	var totalScore: Int {
		get {
			return UserDefaults.standard.integer(forKey: UserDefaultsKey.totalScore.rawValue) 
		}
		set(newValue){
			UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.totalScore.rawValue)
		}
	}
}

enum UserDefaultsKey: String {
	case backgroundImageName
	case totalScore
}
