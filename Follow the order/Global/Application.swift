//
//  Application.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import Foundation

final class Application {
	
	static var shared = Application()
	
	private init() {}
	
	let link = "http://yerkee.com/api/fortune"
	
	var mainBackground: String? {
		get {
			return UserDefaults.standard.string(forKey: UserDefaultsKey.mainBackground.rawValue)
		}
		set(newValue) {
			UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.mainBackground.rawValue)
		}
	}
	
	var totalScore: Int {
		get {
			return UserDefaults.standard.integer(forKey: UserDefaultsKey.totalScore.rawValue) 
		}
		set(newValue) {
			UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.totalScore.rawValue)
		}
	}
}

enum UserDefaultsKey: String {
	case mainBackground
	case totalScore
}
