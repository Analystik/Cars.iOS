//
//  apiResult.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-24.
//  Copyright © 2016 Analystik. All rights reserved.
//

import Foundation

class ApiResult {
	/*let postEndpoint: String = ":http://cars101.azurewebsites.net"
	
	let url = NSURL(string: postEndpoint)!
	
	let session = NSURLSession.sharedSession()
	session.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
	
	do{
	if let webdata = NSString(data:data!, encoding: NSUTF8StringEncoding){
	let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
	//print(jsonDictionary)
	let origin = jsonDictionary["stations"] as! NSArray
	let stationname = origin[9]["s"] as! NSString
	print(stationname)
	dispatch_async(dispatch_get_main_queue(), {
	//self.label.text = stationname.stringByReplacingOccurrencesOfString("/", withString: "-")
	})
	
	}
	
	} catch {
	print("not working")
	
	}
	
	
	
	}).resume()
	*/
	
	
	func getMakers() -> Array<String> {
		return ["Ford", "Mercedes", "Nissan", "GM"];
	}
	
	func getModels()-> Array<String> {
		return ["Fiesta", "Ram"];
	}
	
	func getCars()-> Array<String> {
		return ["2016", "2015", "2014", "2013"];
	}
	
	func getProvinces()-> Array<String> {
		return ["Québec", "Ontario"];
	}
	
	
}