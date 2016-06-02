//  result.swift
//  Copyright © 2016 Analystik. All rights reserved.

import UIKit

class Result: UIViewController {
	let api: ApiResult = ApiResult()
	
	@IBOutlet var depessence: UILabel!
	@IBOutlet var depenceelec: UILabel!
	@IBOutlet var achatelec: UILabel!
	@IBOutlet var remplassepile: UILabel!
	@IBOutlet var essence100: UILabel!
	@IBOutlet var elec100: UILabel!
	@IBOutlet var esstotal: UILabel!
	@IBOutlet var electotal: UILabel!
	@IBOutlet var millage: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let myformat = currencyFormat()
		let kiloFormat = kmFormat()
		
		let finEvaluation = api.calculate(Profil(carId: CurrentValue.car, kmPerYear: KmCurrent.km, provinceId: CurrentValue.province))
		
		depessence.text = "Vous allez dépenser \(myformat.stringForObjectValue(finEvaluation.gasTotalExpensesIn8Years)!) en essence."
		depenceelec.text = "Vous allez dépenser \(myformat.stringForObjectValue(finEvaluation.electricityConsomptionIn8Years)!) en électricité."
		achatelec.text = "Vous allez dépenser \(myformat.stringForObjectValue(finEvaluation.deltaPrice)!) de plus en achetant une voiture électrique."
		remplassepile.text = "Le coût estimé pour le remplacement de la batterie est: \(myformat.stringForObjectValue(finEvaluation.batteryExpenses)!)"
		essence100.text = "\(myformat.stringForObjectValue(finEvaluation.gasTotalExpensesPer100km)!)"
		elec100.text = "\(myformat.stringForObjectValue(finEvaluation.electricityTotalExpensesPer100km)!)"
		esstotal.text = "\(myformat.stringForObjectValue(finEvaluation.gasTotalExpensesIn8Years)!)"
		electotal.text = "\(myformat.stringForObjectValue(finEvaluation.electricityTotalExpensesIn8Years)!)"
		millage.text = "\(kiloFormat.stringForObjectValue(finEvaluation.millageIn8Years)!)km:"
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func currencyFormat() -> NSFormatter {
		let currencyFormatter = NSNumberFormatter()
		currencyFormatter.usesGroupingSeparator = true
		currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
		currencyFormatter.locale = NSLocale(localeIdentifier: "fr_CA")
		
		return currencyFormatter
	}

	func kmFormat() -> NSFormatter {
		let kmFormatter = NSNumberFormatter()
		kmFormatter.usesGroupingSeparator = true
		kmFormatter.numberStyle = NSNumberFormatterStyle.NoStyle
		kmFormatter.locale = NSLocale(localeIdentifier: "fr_CA")
		
		return kmFormatter
	}
}