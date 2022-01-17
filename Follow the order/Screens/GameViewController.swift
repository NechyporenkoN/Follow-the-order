//
//  GameViewController.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import UIKit

class GameViewController: BaseViewController {
	
	@IBOutlet var arenaView: UIView!
	
	private let segueName = "navigateToFinishScreen"
	private let dispatchGroup = DispatchGroup()
	private var availablePositions: [CGPoint] = []
	private var objectSize: CGFloat = 60
	private var isAvailablePlay: Bool = false
	private var correctOrderOfNumbers: [Int] = []
	private var resultOrderOfNumbers: [Int] = []
	private var mainObject: MainObject = .apple
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureNavigationItems()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		availablePositions = calculateSectors(size: objectSize)
		configureObjects()
		configureDispatchGroup()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		correctOrderOfNumbers.removeAll()
		resultOrderOfNumbers.removeAll()
		for subView in arenaView.subviews {
			subView.removeFromSuperview()
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == segueName, let navigation = segue.destination as? UINavigationController, let destination = navigation.topViewController as? FinishViewController {
			destination.type = sender as? ResultType
		}
	}
	
	private func configureObjects() {
		let randomObject = Int.random(in: 0...MainObject.allCases.count-1)
		mainObject = MainObject.allCases[randomObject]
		let totalScore = Application.shared.totalScore
		
		for i in 0..<totalScore {
			let randomElement = Int.random(in: 0...availablePositions.count-1)
			let position = availablePositions[randomElement]
			let object = createObject(frame: CGRect(x: position.x, y: position.y, width: objectSize, height: objectSize))
			object.alpha = 0
			
			object.addTarget(self, action: #selector(objectTapped(_:)), for: .touchUpInside)
			arenaView.addSubview(object)
			dispatchGroup.enter()
			correctOrderOfNumbers.append(i)
			UIView.animate(withDuration: 0.4) {
				object.alpha = 1
			}
			availablePositions.remove(at: randomElement)
			DispatchQueue.main.asyncAfter(deadline: .now() + Double(i+1)) { [weak self] in
				guard let self = self else { return }
				if let object = object as? BaseObjectProtocol {
					object.orderNumber = i
					object.animate()
				}
				if i+1 == totalScore {
					self.isAvailablePlay = true
				}
			}
		}
	}
	
	private func checkResult() {
		if correctOrderOfNumbers == resultOrderOfNumbers {
			Application.shared.totalScore += 1
			navigateToFinishScreen(result: .victory)
		} else {
			navigateToFinishScreen(result: .loss)
		}
	}
	
	private func navigateToFinishScreen(result: ResultType) {
		self.performSegue(withIdentifier: segueName, sender: result)
	}
	
	private func configureDispatchGroup() {
		dispatchGroup.notify(queue: .main) { [weak self] in
			guard let self = self else { return }
			self.isAvailablePlay = false
			self.checkResult()
		}
	}
	
	private func configureNavigationItems() {
		let closeButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(close))
		navigationItem.leftBarButtonItem = closeButton
	}
	
	private func calculateSectors(size: CGFloat) -> [CGPoint] {
		var result: [CGPoint] = []
		let columns = Array(0...Int(arenaView.frame.width/size))
		let lines = Array(0...Int(arenaView.frame.height/size))
		for xPosition in columns {
			for yPosition in lines {
				let position = CGPoint(x: xPosition * Int(size), y: yPosition * Int(size))
				result.append(position)
			}
		}
		return result
	}
	
	private func createObject(frame: CGRect) -> BaseObject {
		switch mainObject {
		case .apple:
			return Apple(frame: frame)
		case .balloon:
			return Balloon(frame: frame)
		case .wheel:
			return Wheel(frame: frame)
		case .star:
			return Star(frame: frame)
		}
	}
	
	@objc func objectTapped(_ object: BaseObject) {
		guard isAvailablePlay else { return }
		if let object = object as? BaseObjectProtocol, let orderNumber = object.orderNumber {
			object.animate()
			dispatchGroup.leave()
			resultOrderOfNumbers.append(orderNumber)
		}
	}
	
	@objc private func close() {
		self.dismiss(animated: false, completion: nil)
	}
}
