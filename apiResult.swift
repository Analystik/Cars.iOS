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
					jsonArray = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
					
					
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
	
	
	
	
	
	
	
	func getMakers() -> Array<Make> {
		let connection = ApiConnection("http://cars101.azurewebsites.net/api/makes")
		var result:Array<Make> = []
		print(connection)
		
		for obj in connection {
			let marque = Make(id: (obj.valueForKey("Id") as? Int)!, name: (obj.valueForKey("Name") as? String)!)
			result.append(marque)
		}
		
		return result
	}
	

	
	
	

	/*func getModels(makerid:String)-> Dictionary<String, String> {
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
	}*/
}