//
//  RequestService.swift
//  Follow the order
//
//  Created by Nikita Nechyporenko on 16.01.2022.
//

import Alamofire

class RequestService {
	
	static func getText(requestURL: String, comletion: @escaping((Message?)->())) {
		AF.request(requestURL, method: .get, encoding: URLEncoding.default).responseJSON { response in
			guard let jsonData = response.data else { return }
			
			let decoder = JSONDecoder()
			
			do {
				let message = try decoder.decode(Message.self, from: jsonData)
				comletion(message)
			} catch {
				print(error)
			}
		}
	}
}
