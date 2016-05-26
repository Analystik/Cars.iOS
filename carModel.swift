//
//  carModel.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-26.
//  Copyright © 2016 Analystik. All rights reserved.
//

import Foundation

class Make{
	var Id: Int;
	var Name: String

	init(id: Int, name:String){
		self.Id = id;
		self.Name = name
	}
}

class Model{
	var Id: Int;
	var Name: String
	var make:Make

	
	init(id: Int, name:String, make:Make){
		self.Id = id;
		self.Name = name
		self.make = make
	}
}

class Car{
	var Id: Int;
	var model:Model
	var Year4Digits:Int
	var Consumption:Double
	var Price:Int
	
	init(id: Int, model:Model, year4digits:Int, consumption:Double, price:Int){
		self.Id = id;
		self.model = model
		self.Year4Digits = year4digits
		self.Consumption = consumption
		self.Price = price
	}
}

class Province{
	var Id: Int;
	var Name: String
	
	init(id: Int, name:String){
		self.Id = id;
		self.Name = name
	}
}

class Profil{
	var CarId: Int;
	var KMPerYear: Int
	var ProvinceId:Int
	
	init(carid: Int, kmperyear:Int, provinceid:Int){
		self.CarId = carid;
		self.KMPerYear = kmperyear;
		self.ProvinceId = provinceid
	}
}
