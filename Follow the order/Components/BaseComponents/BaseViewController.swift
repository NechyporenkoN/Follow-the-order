//
//  BaseViewController.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import UIKit

class BaseViewController: UIViewController {
	
	private var firstAppear: Bool = true
	
	let backgroundImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.image = Background(rawValue: Application.shared.mainBackground ?? "clouds_bg")?.image
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.layer.zPosition = -1
		return imageView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(backgroundImageView)
		setupConstraints()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if firstAppear {
			firstAppear = false
			onFirstAppear()
		}
	}
	
	func updateBackground() {
		backgroundImageView.image = Background(rawValue: Application.shared.mainBackground ?? "clouds_bg")?.image
	}
	
	func onFirstAppear() {
		firstAppear = false
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
		])
	}
}
