//
//  apiResult.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-24.
//  Copyright © 2016 Analystik. All rights reserved.
//

import Foundation

class ApiResult {
	
	
	func ApiConnection(url:String) -> Dictionary<String, String>{
		let newurl = NSURL(string: url)!
		let session = NSURLSession.sharedSession()

		var jsonDictionary:Dictionary<String, String> = [:]
	
		 var semaphore = dispatch_semaphore_create(0)
	
		session.dataTaskWithURL(newurl, completionHandler: { (data, response, error) -> Void in
	
			do{
				if let webdata = NSString(data:data!, encoding: NSUTF8StringEncoding){
					let jsonArray = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
					
					for obj in jsonArray {
						
						var k = String(obj.valueForKey("Id")!)
						var v:String
						if obj.valueForKey("Name") != nil{
						 v = String(obj.valueForKey("Name")!)
						} else {
							v = String(obj.valueForKey("Year4Digits")!)
						}
						
						jsonDictionary[k] = v
						
					}
		
				}
				
			} catch {
				print("not working")
				
			}
			
			dispatch_semaphore_signal(semaphore)

		}).resume()
		
		 dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
		
		return jsonDictionary
	}
	
	func getMakers() -> Dictionary<String, String> {
		let connection = ApiConnection("http://cars101.azurewebsites.net/api/cars/makes")
		return connection
	}
	
	

	func getModels(makerid:String)-> Dictionary<String, String> {
	
		let connection = ApiConnection("http://cars101.azurewebsites.net/api/cars/makes/" + makerid + "/models")
		return connection
		}
	
	
	func getCars(makerid:String, modelid:String)-> Dictionary<String, String> {
		let connection = ApiConnection("http://cars101.azurewebsites.net/api/cars/makes/" + makerid + "/models/" + modelid + "/Cars")
		return connection

	}

	func getProvinces()-> Dictionary<String,String> {
		let connection = ApiConnection("http://cars101.azurewebsites.net/api/cars/api/provinces")
		return connection
	}
	
	
}