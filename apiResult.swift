//  apiResult.swift
//  Copyright © 2016 Analystik. All rights reserved.

import Foundation

class ApiResult {
	
	func ApiGet(url: String) -> NSArray {
		let newUrl = NSURL(string: url)!
		let session = NSURLSession.sharedSession()
		let semaphore = dispatch_semaphore_create(0)
		var jsonArray = []
		
		session.dataTaskWithURL(newUrl, completionHandler: { (data, response, error) -> Void in
			do{
				if NSString(data: data!, encoding: NSUTF8StringEncoding) != nil {
					jsonArray = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [[String:  AnyObject]]
				}
			} catch {
				print("Serialization n'a pas fonctionné")
			}
			
			dispatch_semaphore_signal(semaphore)
		}).resume()
		
		dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
		
		return jsonArray
	}
	
	func ApiPut(profil: Profil) -> AnyObject {
		let request = NSMutableURLRequest(URL: NSURL(string: "http://cars101.azurewebsites.net/api/calculate")!)
		let semaphore = dispatch_semaphore_create(0)
		let session = NSURLSession.sharedSession()
		var jsonResponse: AnyObject = ""
		var params = [:]
		
		request.HTTPMethod = "PUT"
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		request.addValue("application/json", forHTTPHeaderField: "Accept")
		params = [
			"CarId" : profil.carId,
			"KMPerYear" : profil.kmPerYear,
			"ProvinceId" : profil.provinceId
		] as Dictionary<String, AnyObject>
		
		do {
			request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: [])
		} catch {
			print("Serialization n'a pas fonctionné")
		}
		
		let task = session.dataTaskWithRequest(request) { data, response, error in
			guard data != nil else {
				print("Pas de data: \(error)")
				return
			}
			
			do {
				if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
					jsonResponse = json
				} else {
					let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
					print("Erreur, ne parse pas JSON: \(jsonStr)")
				}
			} catch let parseError {
				print(parseError)
				let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
				print("Erreur, ne parse pas JSON: '\(jsonStr)'")
			}
		
			dispatch_semaphore_signal(semaphore)
		}
		
		task.resume()
		dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)

		return jsonResponse
	}
	
	func getMakes() -> Array<Make> {
		let connection = ApiGet("http://cars101.azurewebsites.net/api/makes")
		var result: Array<Make> = []
		
		for obj in connection {
			result.append(Make(json: obj))
		}
		
		return result
	}

	func getModels(makeId: Int) -> Array<Model> {
		let connection = ApiGet("http://cars101.azurewebsites.net/api/makes/" + String(makeId) + "/models")
		var result: Array<Model> = []

		for obj in connection {
			result.append(Model(json: obj))
		}
		
		return result
	}
	
	func getCars(makeId: Int, modelId: Int) -> Array<Car> {
		let connection = ApiGet("http://cars101.azurewebsites.net/api/makes/" + String(makeId) + "/models/" + String(modelId) + "/Cars")
		var result: Array<Car> = []
		
		for obj in connection {
			result.append(Car(json: obj))
		}
		
		return result
	}

	func getProvinces() -> Array<Province> {
		let connection = ApiGet("http://cars101.azurewebsites.net/api/provinces")
		var result: Array<Province> = []
		
		for obj in connection {
			result.append(Province(json: obj))
		}
		
		return result
	}
	
	func calculate(profil: Profil) -> FinancialEvaluation {
		let connection = ApiPut(profil)
		let result = FinancialEvaluation(json: connection)
		
		return result
	}		
}