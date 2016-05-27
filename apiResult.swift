//
//  apiResult.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-24.
//  Copyright © 2016 Analystik. All rights reserved.
//

import Foundation

class ApiResult {
	
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
	
	
	
	func ApiPost(profil:Profil){
		let postEndPoint:String = "http://cars101.azurewebsites.net/api/calculate"
		let url = NSURL(string: postEndPoint)!
		let session = NSURLSession.sharedSession()
		let postParams : [Int] = [2,15000,1]
		
		let request = NSMutableURLRequest(URL: url)
		request.HTTPMethod = "POST"
		request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type" )
		
		do{
			request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(
				postParams, options: NSJSONWritingOptions())
		} catch {
			"DIDN'T work"
		}
		
		session.dataTaskWithRequest(request, completionHandler:
			{(data : NSData?, response: NSURLResponse?, error: NSError?) -> Void in
				guard let realResponse = response as? NSHTTPURLResponse where
					realResponse.statusCode == 200 else {
						print("NOT 200 response")
						return
				}
				if let postString = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
					print("POST: " + postString)
				}
		}).resume()
		
		
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
	
	func calculate(profil:Profil) -> eval{
		let result = eval()
		
		return result
			
		
		}
		
	}
