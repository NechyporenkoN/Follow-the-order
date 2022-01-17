//
//  SettingsViewController.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import UIKit

class SettingsViewController: BaseViewController {
	
	@IBOutlet var scrollView: UIScrollView!
	
	@IBOutlet var pageControl: UIPageControl!
	
	@IBOutlet var cancelButton: BaseButton!
	
	@IBOutlet var saveButton: BaseButton!
	
	private var imageViews: [UIImageView] = []
	private var frame = CGRect.zero
	private var currentIndex = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configurePageControl()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		for index in 0..<Background.allCases.count {
			setFrame(index: index)
			self.imageViews[index].frame = frame
		}
		
		scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(Background.allCases.count)), height: scrollView.frame.size.height)
		scrollView.setContentOffset(CGPoint(x: (scrollView.frame.size.width * CGFloat(currentIndex)), y: 0), animated: true)
	}
	
	private func setFrame(index: Int) {
		frame.origin.x = scrollView.frame.size.width * CGFloat(index)
		frame.size = scrollView.frame.size
	}
	
	func configurePageControl() {
		pageControl.numberOfPages = Background.allCases.count
		
		for index in 0..<Background.allCases.count {
			setFrame(index: index)
			let imageView = UIImageView(frame: frame)
			imageView.image = Background.allCases[index].image
			imageView.clipsToBounds = true
			imageView.contentMode = .scaleAspectFill
			self.imageViews.append(imageView)
			self.scrollView.addSubview(imageView)
		}
		scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(Background.allCases.count)), height: scrollView.frame.size.height)
		scrollView.delegate = self
	}
	
	@IBAction func cancelButton(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
	
	@IBAction func saveButton(_ sender: Any) {
		Application.shared.mainBackground = Background.allCases[currentIndex].rawValue
		updateBackground()
		self.dismiss(animated: true, completion: nil)
	}
}

extension SettingsViewController: UIScrollViewDelegate {
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		guard scrollView == self.scrollView else { return }
		let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
		pageControl.currentPage = Int(pageNumber)
		currentIndex = Int(pageNumber)
	}
	
	func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
		scrollView.pinchGestureRecognizer?.isEnabled = false
	}
}
