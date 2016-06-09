//  carModel.swift
//  Copyright © 2016 Analystik. All rights reserved.

import Foundation


extension Array where Element: HasTitle {

    func ToDictionary() -> Dictionary<Int, String> {
        var d = Dictionary<Int,String>()
        for ele in self {
            d[ele.id] = ele.title()
        }
        return d
    }
}

protocol HasTitle{
	var id: Int! {get}
	func title() -> String
}

class  Make: HasTitle{
	var id: Int!
	var name: String!

	init(){
		self.id = 0;
		self.name = ""
	}
	
	init(json: AnyObject){
		if let id = json["Id"] as? Int{
			self.id = id
		}
		
		if let name = json["Name"] as? String{
			self.name = name
		}
	}
	
	func title() -> String{
		return self.name
	}
}

class Model: HasTitle{
	var id: Int!
	var name: String!
	var make: Make
	
	init(){
		self.id = 0;
		self.name = ""
		self.make =  Make()
	}
	
	init(json: AnyObject){
		if let id = json["Id"] as? Int{
			self.id = id
		}
		
		if let name = json["Name"] as? String{
			self.name = name
		}
		
		self.make = Make()
	}
	
	func title() -> String{
		return self.name
	}
}

class Car: HasTitle{
	var id: Int!
	var model:Model
	var year4Digits: Int!
	var consumption: Double!
	var price: Int!
	
	init(){
		self.id = 0;
		self.model = Model()
		self.year4Digits = 0
		self.consumption = 0.00
		self.price = 0
	}
	
	init(json: AnyObject){
		if let id = json["Id"] as? Int{
			self.id = id
		}
		
		if let name = json["Year4Digits"] as? Int{
			self.year4Digits = name
		}
		
		if let consumption = json["Consumption"] as? Double{
			self.consumption = consumption
		}
		
		if let price = json["Price"] as? Int{
			self.price = price }
		
		self.model = Model()
	}
	
	func title() -> String{
		return String(self.year4Digits)
	}
}

class Province: HasTitle{
	var id: Int!
	var name: String!
	
	init(){
		self.id = 0;
		self.name = ""
	}
	
	init(json: AnyObject){
		if let id = json["Id"] as? Int{
			self.id = id
		}
		
		if let name = json["Name"] as? String{
			self.name = name
		}
	}
	
	func title() -> String{
		return self.name
	}
}

class Profil{
	var carId: Int!
	var kmPerYear: Int!
	var provinceId: Int!
	
	init(carId: Int, kmPerYear: Int, provinceId: Int){
		self.carId = carId;
		self.kmPerYear = kmPerYear;
		self.provinceId = provinceId
	}
}

class FinancialEvaluation{
	var batteryExpenses = 9.99
	var deltaPrice = 9.99
	var electricityConsomptionIn8Years = 9.99
	var electricityTotalExpensesIn8Years:Double = 9.99
	var electricityTotalExpensesPer100km = 9.99
	var gasConsomptionIn8Years = 9.99
	var gasTotalExpensesIn8Years:Double = 9.99
	var gasTotalExpensesPer100km = 9.99
	var millageIn8Years = 9.99
	var electricityconsumptionexpensesin8years = 9.99

	init(){
	}

	init(json:AnyObject){
		if let bat = json["BatteryExpenses"] as? Double{
			self.batteryExpenses = bat
		}
		
		if let bat = json["DeltaPrice"] as? Double{
			self.deltaPrice = bat
		}
		
		if let bat = json["ElectricityConsumptionIn8Years"] as? Double{
			self.electricityConsomptionIn8Years = bat
		}
		
		if let bat = json["ElectricityTotalExpensesIn8Years"] as? Double{
			self.electricityTotalExpensesIn8Years = bat
		}
		
		if let bat = json["ElectricityTotalExpensesPer100km"] as? Double{
			self.electricityTotalExpensesPer100km = bat
		}
		
		if let bat = json["GasConsumptionIn8Years"] as? Double{
			self.gasConsomptionIn8Years = bat
		}
		
		if let bat = json["GasTotalExpensesIn8Years"] as? Double{
			self.gasTotalExpensesIn8Years = bat
		}
		
		if let bat = json["GasTotalExpensesPer100km"] as? Double{
			self.gasTotalExpensesPer100km = bat
		}
		
		if let bat = json["MileageIn8Years"] as? Double{
			self.millageIn8Years = bat
		}
		if let bat = json["ElectricityConsumptionExpensesIn8Years"] as? Double{
			self.electricityconsumptionexpensesin8years = bat
		}
	}
}