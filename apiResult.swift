//
//  apiResult.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-24.
//  Copyright © 2016 Analystik. All rights reserved.
//

import Foundation

class ApiResult {
	
	let profil:Profil! = nil
	
	
	func ApiConnection(url:String) -> NSArray{
		let newurl = NSURL(string: url)!
		let session = NSURLSession.sharedSession()
		let semaphore = dispatch_semaphore_create(0)
		var jsonArray = []
		
		session.dataTaskWithURL(newurl, completionHandler: { (data, response, error) -> Void in
			do{
				if let webdata = NSString(data:data!, encoding: NSUTF8StringEncoding) {
					jsonArray = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [[String:AnyObject]]
					
					
				}
				
			} catch {
				print("not working")
				
			}
			
			dispatch_semaphore_signal(semaphore)
			
		}).resume()
		
		dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
		
		return jsonArray
	}
	
	
	
	

	// to test
	
	
	
	func ApiPost(profil:Profil) -> AnyObject{
		
		let request = NSMutableURLRequest(URL: NSURL(string: "http://cars101.azurewebsites.net/api/calculate")!)
		let semaphore = dispatch_semaphore_create(0)
		let session = NSURLSession.sharedSession()
		var jsonresponse:AnyObject = ""
		request.HTTPMethod = "PUT"
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		request.addValue("application/json", forHTTPHeaderField: "Accept")
		let params = [
			"CarId" : profil.CarId,
			"KMPerYear" : profil.KMPerYear,
			"ProvinceId" : profil.ProvinceId] as Dictionary<String, AnyObject>
		do {
			request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: [])
		} catch {
			print(error)
		}
		
		let task = session.dataTaskWithRequest(request) { data, response, error in
			guard data != nil else {
				print("no data found: \(error)")
				return
			}
			do {
				if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
					let success = json["success"] as? Int
					print("Success: \(success)")
					print(response)
					print(json)
					jsonresponse = json
					} else {
					let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
					print("Error could not parse JSON: \(jsonStr)")
				}
			} catch let parseError {
				print(parseError)
				let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
				print("Error could not parse JSON: '\(jsonStr)'")
			}
		
			dispatch_semaphore_signal(semaphore)

		}
		task.resume()
			dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)

		return jsonresponse
	}
	
	
	
	func getMakers() -> Array<Make> {
		let connection = ApiConnection("http://cars101.azurewebsites.net/api/makes")
		var result:Array<Make> = []
		
		for obj in connection {
			result.append(Make(json: obj))
		}
		
		
		return result
	}

	
	
	
	func getModels(makerid:Int)-> Array<Model> {
		let connection = ApiConnection("http://cars101.azurewebsites.net/api/makes/" +  String(makerid) + "/models")
		var result:Array<Model> = []

		for obj in connection {
			result.append(Model(json: obj))
		}
		
		return result
	}
	
	func getCars(makerid:Int, modelid:Int)-> Array<Car> {
		let connection = ApiConnection("http://cars101.azurewebsites.net/api/makes/" + String(makerid) + "/models/" + String(modelid) + "/Cars")
		var result:Array<Car> = []
		
		for obj in connection {
			result.append(Car(json: obj))
		}
		
		return result
	}

	func getProvinces()-> Array<Province> {
	let connection = ApiConnection("http://cars101.azurewebsites.net/api/provinces")
		var result:Array<Province> = []
		
		for obj in connection {
			result.append(Province(json: obj))
		}
		
		
		return result
	
	}
	
	func calculate(profil:Profil) -> FinancialEvaluation{
		
		let connection = ApiPost(profil)
		let result = FinancialEvaluation(json: connection)
		return result
		
		}
		
	}