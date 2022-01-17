//
//  AppDelegate.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		setTotalScore()
		setBackground()
		setInitialScreen()
		return true
	}
	
	func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
		return UIInterfaceOrientationMask.portrait
	}
	
	private func setInitialScreen() {
		self.window = UIWindow(frame: UIScreen.main.bounds)
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let initialViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
		self.window?.rootViewController = initialViewController
		self.window?.makeKeyAndVisible()
	}
	
	private func setTotalScore() {
		if Application.shared.totalScore == 0 {
			Application.shared.totalScore = 5
		}
	}
	
	private func setBackground() {
		if Application.shared.mainBackground == nil {
			Application.shared.mainBackground = Background.clouds.rawValue
		}
	}
}
