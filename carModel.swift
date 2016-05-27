//
//  carModel.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-26.
//  Copyright © 2016 Analystik. All rights reserved.
//

import Foundation

protocol HasTitle{
	func title() -> String
	var Id: Int! {get}
}


class Make:HasTitle{
	var Id: Int!
	var Name: String!

	init(){
		self.Id = 0;
		self.Name = ""
	}
	init(json:AnyObject){
		if let id = json["Id"] as? Int{
			self.Id = id
		}
		
		if let name = json["Name"] as? String{
			self.Name = name
		}
	}
	
	func title() -> String{
		return self.Name
	}
	
}

class Model:HasTitle{
	
	var Id: Int!
	var Name: String!
	var make:Make

	
	init(){
		self.Id = 0;
		self.Name = ""
		self.make = Make()

	}
	init(json:AnyObject){
		if let id = json["Id"] as? Int{
			self.Id = id
		}
		
		if let name = json["Name"] as? String{
			self.Name = name
		}
		
		self.make = Make()

	}
	
	func title() -> String{
		return self.Name
	}

}

class Car:HasTitle{
	var Id: Int!
	var model:Model
	var Year4Digits: Int!
	var Consumption: Double!
	var Price: Int!
	
	init(){
		self.Id = 0;
		self.model = Model()
		self.Year4Digits = 0
		self.Consumption = 0.00
		self.Price = 0
	}
	init(json:AnyObject){
		if let id = json["Id"] as? Int{
			self.Id = id
		}
		
		if let name = json["Year4Digits"] as? Int{
			self.Year4Digits = name
		}
		
		if let consumption = json["Consumption"] as? Double{
			self.Consumption = consumption
		}
		
		if let price = json["Price"] as? Int{
			self.Price = price }
		
		self.model = Model()
		
	}
	
	func title() -> String{
		return String(self.Year4Digits)
	}

}

class Province:HasTitle{
	var Id: Int!
	var Name: String!
	
	
	init(){
		self.Id = 0;
		self.Name = ""
	}
	init(json:AnyObject){
		if let id = json["Id"] as? Int{
			self.Id = id
		}
		
		if let name = json["Name"] as? String{
			self.Name = name
		}
	}
	
	func title() -> String{
		return self.Name
	}

}

class Profil{
	var CarId: Int!
	var KMPerYear: Int!
	var ProvinceId:Int!
	
	init(carid: Int, kmperyear:Int, provinceid:Int){
		self.CarId = carid;
		self.KMPerYear = kmperyear;
		self.ProvinceId = provinceid
	}
}

class eval{
	var batterie = 9.99
	var delta = 9.99
	var Elec8years = 9.99
	var TotalElec8years:Double = 9.99
	var TotalElec100 = 9.99
	var Gaz8years = 9.99
	var TotalGaz8years:Double = 9.99
	var TotalGaz100 = 9.99
	var millage8y = 9.99


	init()
	{}

}

