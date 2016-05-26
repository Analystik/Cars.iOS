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
		let semaphore = dispatch_semaphore_create(0)
	
		session.dataTaskWithURL(newurl, completionHandler: { (data, response, error) -> Void in
			do{
				if let webdata = NSString(data:data!, encoding: NSUTF8StringEncoding) {
					let jsonArray = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
					
					for obj in jsonArray {
						var k = String(obj.valueForKey("Id")!)
						var v:String
						
						if obj.valueForKey("Name") != nil {
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
	
// to test
	
	
	
	func ApiPost(){
		let postEndPoint:String = "http://cars101.azurewebsites.net/api/calculate"
		let url = NSURL(string: postEndPoint)!
		let session = NSURLSession.sharedSession()
		let postParams : [String: AnyObject] = ["hello": "hello post world"]
		
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
	
	
	
	
	
	
	
	func getMakers() -> Dictionary<String, String> {
		let connection = ApiConnection("http://cars101.azurewebsites.net/api/makes")
		return connection
	}

	func getModels(makerid:String)-> Dictionary<String, String> {
		let connection = ApiConnection("http://cars101.azurewebsites.net/api/makes/" + makerid + "/models")
		return connection
	}
	
	func getCars(makerid:String, modelid:String)-> Dictionary<String, String> {
		let connection = ApiConnection("http://cars101.azurewebsites.net/api/makes/" + makerid + "/models/" + modelid + "/Cars")
		return connection
	}

	func getProvinces()-> Dictionary<String,String> {
		let connection = ApiConnection("http://cars101.azurewebsites.net/api/provinces")
		return connection
	}
}