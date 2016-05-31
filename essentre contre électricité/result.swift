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
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		let myformat = currencyFormat()

		let finEvaluation = api.calculate(Profil(carId: CurrentValue.car, kmPerYear: KmCurrent.km, provinceId: CurrentValue.province))
		
		depessence.text = "Vous dépenserez \(myformat.stringForObjectValue(finEvaluation.gasTotalExpensesIn8Years)!) sur l'essence"
		depenceelec.text = "Vous dépenserez \(myformat.stringForObjectValue(finEvaluation.electricityTotalExpensesIn8Years)!) sur l'électricité"
		achatelec.text = "Vous allez dépenser \(myformat.stringForObjectValue(finEvaluation.deltaPrice)!) de plus pour acheter une voiture électrique (incluant la subvention)."
		remplassepile.text = "Le coût de remplacement des piles est de: \(myformat.stringForObjectValue(finEvaluation.batteryExpenses)!)"
		essence100.text = "\(myformat.stringForObjectValue(finEvaluation.gasTotalExpensesPer100km)!) sur 100km"
		elec100.text = "\(myformat.stringForObjectValue(finEvaluation.electricityTotalExpensesPer100km)!) sur 100km"
		esstotal.text = "\(myformat.stringForObjectValue(finEvaluation.gasTotalExpensesIn8Years)!) sur 8ans"
		electotal.text = "\(myformat.stringForObjectValue(finEvaluation.electricityTotalExpensesIn8Years)!) sur 8ans"
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
}